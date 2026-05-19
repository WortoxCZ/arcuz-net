// Arcuz coop — session relay / persistent server.
// Runs on the host machine. All player clients connect to it via XMLSocket.
//
//   GAME_PORT   (default 8843): session server
//   POLICY_PORT (default 843):  Flash cross-domain policy responder
//
// Wire format: ASCII, '|'-delimited, null-terminated ('\0'). For typed messages
// carrying a JSON blob, the blob is the remainder after the leading field(s) and
// may itself contain '|'.
//
// The relay owns persistent shared world state: the STORY blob (computed by the
// host client, just persisted+rebroadcast here) and the STASH (an array of opaque
// item blobs it arbitrates directly). Live enemy state is NOT persisted — it is
// per-cell and ephemeral, routed between a cell's authority and its viewers.
//
// Client -> relay:
//   HELLO|<name>            request to join; relay replies ID, STORY, STASHALL, ROSTER
//   CELL|<cellKey>          "I am now in this cell"
//   AV|<blob>               my avatar state  -> co-located players
//   SNAP|<blob>             enemy snapshot (authority only) -> viewers of my cell
//   EV|<blob>               generic game event -> everyone else
//   STORYSET|<json>         host client pushes new story state -> persisted + broadcast
//   STASHADD|<itemBlob>     deposit one item into the shared stash
//   STASHTAKE|<index>       withdraw stash item at index (relay arbitrates)
//   BYE
//
// Relay -> client:
//   ID|<id>|<isHost>        your player id; isHost = 1 for the first client
//   STORY|<json>            full current story state
//   STASHALL|<json>         full stash (array of item blobs)
//   ROSTER|<json>           [{id,name}, ...] of connected players
//   JOIN|<id>|<name>        a player connected
//   LEFT|<id>               a player disconnected
//   AUTH|1                  you are authority for the cell you just entered
//   AUTH|0|<authId>         you are a viewer; <authId> is the cell's authority
//   BECOMEAUTH              you are now authority (the old one left your cell)
//   VIEWER|<id>             (to authority) a viewer entered your cell
//   UNVIEW|<id>             (to authority) a viewer left your cell
//   AV|<id>|<blob>          another player's avatar state
//   SNAP|<blob>             authority's enemy snapshot for your cell
//   EV|<id>|<blob>          a game event from player <id>
//   BYE

const net = require('net');
const fs = require('fs');
const path = require('path');

const GAME_PORT   = Number(process.env.GAME_PORT)   || 8843;
const POLICY_PORT = Number(process.env.POLICY_PORT) || 843;
const VERBOSE     = process.env.VERBOSE !== '0';
const WORLD_FILE  = path.join(__dirname, 'world.json');

const POLICY_XML =
    '<?xml version="1.0"?>' +
    '<!DOCTYPE cross-domain-policy SYSTEM "/xml/dtds/cross-domain-policy.dtd">' +
    '<cross-domain-policy>' +
    '<site-control permitted-cross-domain-policies="master-only"/>' +
    '<allow-access-from domain="*" to-ports="*" secure="false"/>' +
    '</cross-domain-policy>\0';

function log(...args) {
    if (!VERBOSE) return;
    process.stdout.write(new Date().toISOString().slice(11, 23) + ' ' + args.join(' ') + '\n');
}

// ---- persistent shared world state -----------------------------------------
let world = { story: '', stash: [] };
try {
    world = JSON.parse(fs.readFileSync(WORLD_FILE, 'utf8'));
    if (!Array.isArray(world.stash)) world.stash = [];
    if (typeof world.story !== 'string') world.story = '';
    log(`loaded world.json (story ${world.story.length}b, ${world.stash.length} stash items)`);
} catch (e) {
    log('no world.json — starting fresh');
}
let saveTimer = null;
function persist() {
    if (saveTimer) return;
    saveTimer = setTimeout(() => {
        saveTimer = null;
        try { fs.writeFileSync(WORLD_FILE, JSON.stringify(world)); }
        catch (e) { log('world.json write failed:', e.message); }
    }, 500);
}

// ---- connected players + cells ---------------------------------------------
const players = new Map();          // id -> { id, name, sock, cell }
const cells = new Map();            // cellKey -> { members:Set<id>, authority:id|null }
let nextId = 0;

function send(id, msg) {
    const p = players.get(id);
    if (p && !p.sock.destroyed) p.sock.write(msg + '\0');
}
function broadcast(msg, exceptId) {
    for (const p of players.values()) {
        if (p.id !== exceptId && !p.sock.destroyed) p.sock.write(msg + '\0');
    }
}
function sendToCell(cellKey, msg, exceptId) {
    const c = cells.get(cellKey);
    if (!c) return;
    for (const id of c.members) {
        if (id !== exceptId) send(id, msg);
    }
}
function rosterJSON() {
    return JSON.stringify([...players.values()].map(p => ({ id: p.id, name: p.name })));
}

function leaveCell(id) {
    const p = players.get(id);
    if (!p || !p.cell) return;
    const key = p.cell;
    const c = cells.get(key);
    p.cell = null;
    if (!c) return;
    c.members.delete(id);
    if (c.members.size === 0) {
        cells.delete(key);
        return;
    }
    if (c.authority === id) {
        // authority left — promote the first remaining member
        c.authority = c.members.values().next().value;
        send(c.authority, 'BECOMEAUTH');
        log(`cell ${key} authority -> ${c.authority}`);
    }
    sendToCell(key, `UNVIEW|${id}`, id);
}

function enterCell(id, cellKey) {
    const p = players.get(id);
    if (!p) return;
    // Note: no same-cell early-return — a player re-sending its current cell
    // (e.g. after a death/reload) must re-register so authority is re-evaluated.
    if (p.cell) leaveCell(id);
    p.cell = cellKey;
    let c = cells.get(cellKey);
    if (!c) { c = { members: new Set(), authority: null }; cells.set(cellKey, c); }
    c.members.add(id);
    if (c.authority == null) {
        c.authority = id;
        send(id, 'AUTH|1');
        log(`player ${id} -> cell ${cellKey} (authority)`);
    } else {
        send(id, `AUTH|0|${c.authority}`);
        send(c.authority, `VIEWER|${id}`);   // cue authority to push a full snapshot
        log(`player ${id} -> cell ${cellKey} (viewer of ${c.authority})`);
    }
}

function handleMessage(sock, msg) {
    // pre-join: only HELLO (or an inline policy probe) is accepted
    if (sock._id == null) {
        if (msg.startsWith('<policy-file-request')) { sock.write(POLICY_XML); return; }
        const cut = msg.indexOf('|');
        const type = cut === -1 ? msg : msg.slice(0, cut);
        if (type !== 'HELLO') {
            sock.write('BYE\0'); sock.end(); return;
        }
        const name = (cut === -1 ? '' : msg.slice(cut + 1)) || ('player' + nextId);
        const id = nextId++;
        const isHost = players.size === 0 ? 1 : 0;
        sock._id = id;
        players.set(id, { id, name, sock, cell: null });
        log(`player ${id} "${name}" joined${isHost ? ' (host)' : ''}`);
        send(id, `ID|${id}|${isHost}`);
        send(id, `STORY|${world.story}`);
        send(id, `STASHALL|${JSON.stringify(world.stash)}`);
        send(id, `ROSTER|${rosterJSON()}`);
        broadcast(`JOIN|${id}|${name}`, id);
        return;
    }

    const id = sock._id;
    const cut = msg.indexOf('|');
    const type = cut === -1 ? msg : msg.slice(0, cut);
    const rest = cut === -1 ? '' : msg.slice(cut + 1);

    switch (type) {
        case 'CELL':
            enterCell(id, rest);
            break;
        case 'AV':
            sendToCell(players.get(id).cell, `AV|${id}|${rest}`, id);
            break;
        case 'SNAP': {
            // only the cell's authority may drive snapshots
            const c = cells.get(players.get(id).cell);
            if (c && c.authority === id) sendToCell(players.get(id).cell, `SNAP|${rest}`, id);
            break;
        }
        case 'EV':
            broadcast(`EV|${id}|${rest}`, id);
            break;
        case 'CMD': {
            // viewer -> the authority of the viewer's cell (e.g. "I hit enemy X")
            const c = cells.get(players.get(id).cell);
            if (c && c.authority != null && c.authority !== id) {
                send(c.authority, `CMD|${id}|${rest}`);
            }
            break;
        }
        case 'DMG': {
            // authority -> a specific player ("an enemy hit you for N")
            const i1 = rest.indexOf('|');
            if (i1 !== -1) send(Number(rest.slice(0, i1)), `DMG|${rest.slice(i1 + 1)}`);
            break;
        }
        case 'STORYSET':
            world.story = rest;
            persist();
            broadcast(`STORY|${world.story}`, id);
            break;
        case 'STASHADD':
            world.stash.push(rest);
            persist();
            log(`STASHADD ${JSON.stringify(rest)}`);
            broadcast(`STASHALL|${JSON.stringify(world.stash)}`);
            break;
        case 'STASHTAKE': {
            // Pop the oldest item to exactly one taker — the relay serialises
            // requests, so two simultaneous takers get two different items,
            // never the same one. No duplication possible.
            if (world.stash.length > 0) {
                const blob = world.stash.shift();
                persist();
                log(`STASHTAKE -> ${JSON.stringify(blob)}`);
                send(id, `STASHGOT|${blob}`);
                broadcast(`STASHALL|${JSON.stringify(world.stash)}`);
            } else {
                send(id, 'STASHEMPTY');
            }
            break;
        }
        case 'BYE':
            sock.end();
            break;
        default:
            log(`player ${id} sent unknown type ${JSON.stringify(type)}`);
    }
}

function dropPlayer(sock) {
    if (sock._id == null) return;
    const id = sock._id;
    leaveCell(id);
    players.delete(id);
    log(`player ${id} disconnected`);
    broadcast(`LEFT|${id}`);
}

const gameServer = net.createServer((sock) => {
    sock.setNoDelay(true);
    sock.setEncoding('utf8');
    let buf = '';
    sock.on('data', (chunk) => {
        buf += chunk;
        let idx;
        while ((idx = buf.indexOf('\0')) !== -1) {
            const m = buf.slice(0, idx);
            buf = buf.slice(idx + 1);
            if (m.length) handleMessage(sock, m);
        }
    });
    sock.on('close', () => dropPlayer(sock));
    sock.on('error', (err) => log(`socket error (player ${sock._id}):`, err.code || err.message));
});
gameServer.on('error', (err) => {
    if (err.code === 'EADDRINUSE') {
        console.error(`Port ${GAME_PORT} already in use — another relay is probably running.`);
        process.exit(1);
    }
    console.error('Game server error:', err);
    process.exit(1);
});
gameServer.listen(GAME_PORT, () => log(`session relay listening on tcp/${GAME_PORT}`));

// Flash cross-domain policy responder (TCP 843).
const policyServer = net.createServer((sock) => {
    let buf = '';
    sock.setEncoding('utf8');
    sock.on('data', (chunk) => {
        buf += chunk;
        if (buf.includes('<policy-file-request')) { sock.write(POLICY_XML); sock.end(); }
    });
    sock.on('error', () => {});
});
policyServer.on('error', (err) => {
    if (err.code === 'EACCES') {
        console.error(`Cannot bind policy port ${POLICY_PORT} (needs admin for ports <1024).`);
        console.error(`Continuing without it — Flash may refuse XMLSocket unless served elsewhere.`);
    } else {
        console.error('Policy server error:', err);
    }
});
policyServer.listen(POLICY_PORT, () => log(`policy server listening on tcp/${POLICY_PORT}`));
