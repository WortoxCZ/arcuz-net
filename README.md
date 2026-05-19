# Arcuz Co-op

Online co-op multiplayer for **Arcuz**, the 2010 Flash action-RPG by Funnaut.
N players, one shared world: shared screen enemies, shared quests, shared
story, shared item box. Each player keeps their own character (gear, stats,
skills, level, XP).

This is a community preservation / mod project. The original developer
(Funnaut) has been missing since ~2015 and the game is unmaintained; if the
rightful holder ever surfaces, this will be taken down.

## Features

- **N-player co-op** — not limited to two.
- **Per-cell authority** — each player roams independently; when more than
  one player is on the same screen, the first one in simulates its enemies,
  the others render puppets driven by snapshots. Authority hands off when the
  first player leaves.
- **Synced enemy mechanics**, including the gnarly ones:
  - Ranged attacks: archer arrows, mage projectiles, telegraphed elemental AoEs
  - Ghost decoy split
  - Final boss — body, HP, melee, all ranged attacks (fire rain, ice volleys,
    ice ring), and the rage-mode 4-ghost elemental summon
- **Shared progression** — quests and story fully shared; full XP to every
  player in the cell; loot rolled independently per player; shared item box
  (open inventory + press **G**) arbitrated by the relay.
- **Persistence** — story + stash saved to `world.json` on the host, survives
  restarts.
- **Quality-of-life tweaks** — compose-fail removed, rarity drops boosted,
  chapter-2 centaur quest chest at 100% (the original 20% was hours of farming).

## Play

Grab the latest release zip, unzip, read its `README.txt`. Host runs
`Host-Windows.cmd` (or `Host-Mac.command`); joiners run the `Join-*` equivalent
and enter the host's IP.

- **Host needs Node.js** (https://nodejs.org/). Joiners don't.
- **Windows** — the Adobe Flash Player 32 standalone projector is bundled.
- **macOS** — drop your own `Flash Player.app` into the folder (any
  standalone Flash projector works).

Same Wi-Fi → just use the host's local IPv4. Over the internet → host
port-forwards TCP 8843.

## Source layout

| Path | What it is |
|---|---|
| `arcuz-5003.swf` | the original game, used as the build input |
| `patch/` | the coop mod — overrides only the scripts that change |
| `patch-test/` | same plus dev toggles (invincibility on `H`, infinite SP, forced level 15, a complex-enemy layout on Arcuz Plains) |
| `relay/relay.js` | tiny Node TCP server — session/cell/snapshot routing, story+stash persistence |
| `dist/arcuz-coop/` | the playable distributable (also zipped as `dist/arcuz-coop.zip`) |

Most of the technique is in `patch/frame_2/DoAction.as` (extensions, prototype
hooks, viewer-side attack replication, ghost summon/split sync) and
`patch/frame_71/DoAction.as` (the original net layer — at its compiled-size
ceiling, hence frame_2 for everything new). A handful of classes are also
recompiled in `patch/__Packages/` for QoL tweaks. `Map.as` is NOT
recompiled — it doesn't round-trip cleanly through FFDec; the few lines that
mattered are runtime-patched via a `frame_2` prototype hook.

## Build

Requires [JPEXS Free Flash Decompiler](https://github.com/jindrapetrik/jpexs-decompiler).

```
cp arcuz-5003.swf arcuz-net.swf
"<path-to>/ffdec-cli.exe" -importScript arcuz-net.swf arcuz-net.swf patch/
```

For the test build, point at `patch-test/` instead → `arcuz-test.swf`.

`decompiled/` is the full FFDec script export of `arcuz-5003.swf` — checked
in so the original game's code is browsable directly on GitHub. You can
regenerate it any time with
`ffdec-cli -export script decompiled arcuz-5003.swf`.

## Credits

- **Funnaut** — for Arcuz. Wherever you are.
- **Adobe** — for the standalone Flash Player projector.

## License

The code in `patch/`, `patch-test/`, `relay/`, the launchers, and this README
are released under the **MIT License** — do what you want with them.

The `arcuz-5003.swf` game data is © Funnaut and is included here under a
preservation / abandoned-work assumption (see the note at the top).
