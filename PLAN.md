# Arcuz coop — implementation plan

N-player online coop for Arcuz (AS2 RPG). Each player roams independently; a "cell"
(one map object) becomes shared only when >1 player is in it.

## Design (locked)

- **Per-cell authority.** First player in a cell simulates its enemies; co-located
  players are viewers rendering puppets from snapshots. Authority hands off to a
  remaining viewer when it leaves.
- **Relay = persistent server** on the host machine. Owns the STORY blob (computed by
  the host client, persisted+rebroadcast) and the STASH (opaque item blobs it
  arbitrates). Saves `world.json`. No host migration.
- **Character state is local** to each player (gear, stats, skills, level, inventory,
  XP) — normal SP-style SharedObject save.
- Players see each other (puppet avatars). Quests fully shared. XP full to every
  player in the cell. Loot is one shared object, first-grab wins. Reconnection
  supported; no lobby.

## State ownership

| State | Owner | Persistence |
|---|---|---|
| Character (gear/stats/skills/level/inventory/XP) | each player, locally | local SharedObject |
| Story (chapter/phase/questList/mapVisit) | host client computes; relay stores | `world.json` |
| Knight Paul stash | relay | `world.json` |
| Live enemy state per occupied cell | first-in player (rotates) | none |
| Session: ids, roster, cell→authority | relay | none |

## Phases

1. **Net foundation** — relay session server (DONE: `relay/relay.js`); SWF net
   bootstrap: netcfg load, XMLSocket connect, inbox/outbox, player id.
2. **Co-location** — report cell on every `changeMap`; broadcast own avatar; render
   other players in the same cell as puppet avatars.
3. **Shared enemies** — per-cell enemy index; authority snapshots; viewers run
   `createEnemy` then convert enemies to puppets; authority assignment + handoff.
4. **Shared quests + story** — story replicated via relay; quest events broadcast.
5. **Loot / XP / stash** — synced first-grab loot; XP to all in cell; Knight Paul
   shared stash.
6. **Persistence, reconnection, packaging** — local saves; relay disk persistence;
   reconnect flow; dist build.

## Relay protocol

See the header comment in `relay/relay.js` for the full message list. Wire format:
ASCII, `|`-delimited, `\0`-terminated. JSON blobs ride as the trailing field.

## Key engine facts

- World = grid of `map_AA_RRCC` data objects in `frame_3/DoAction.as`; each has its
  own `createEnemy()` hard-coding enemies at fixed positions/levels.
- `Map.changeMap()` tears down everything except the player and rebuilds; enemies are
  regenerated per visit; kills tracked in `game.deadList[area]` as `mapName_x_y` keys.
- `_root.game` (Game MC) attached in `frame_71`; current map is `_root.game.map`.
