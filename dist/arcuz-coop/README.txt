============================================================
  ARCUZ  --  Online Co-op
============================================================

Play the Arcuz action-RPG together online. One player HOSTS
(runs the session server); everyone else JOINS.

Co-op features: you see each other in the world, share enemies
when on the same screen, shared quests and story progress, XP
to everyone, shared loot, and a shared item box (open your
inventory and press G to deposit a hovered item or withdraw).
Your character (gear, stats, skills, level) is saved locally
and is yours alone.


------------------------------------------------------------
  WHAT'S IN THIS FOLDER
------------------------------------------------------------
  arcuz-net.swf          The game.
  flashplayer_32_sa.exe  Flash player (Windows). Mac: see below.
  relay/relay.js         The session server (the host runs it).
  Host-Windows.cmd       Start as host  (Windows).
  Join-Windows.cmd       Join a host    (Windows).
  Host-Mac.command       Start as host  (macOS).
  Join-Mac.command       Join a host    (macOS).
  netcfg.txt             Auto-written by the launchers. Don't edit.

Keep every file together in this one folder. Don't move them
into subfolders -- the game reads netcfg.txt from beside itself.


------------------------------------------------------------
  REQUIREMENTS
------------------------------------------------------------
  HOST  : Node.js installed (https://nodejs.org/). Joiners do
          NOT need it -- only the host runs the relay.
  macOS : a standalone Flash player. Put it in this folder
          renamed to exactly  Flash Player.app
          (any Flash Player projector / Flashpoint's works).
  Windows: nothing extra -- the player is bundled.


------------------------------------------------------------
  HOW TO PLAY
------------------------------------------------------------
HOST (one person):
  1. Double-click Host-Windows.cmd  (or Host-Mac.command).
  2. Type a player name.
  3. A relay window opens -- LEAVE IT OPEN the whole session.
     It is the server; closing it ends the game for everyone.
  4. The game launches. Play normally.
  5. If Windows asks to allow "node" through the firewall,
     click Allow (needed so others can connect).

JOIN (everyone else):
  1. Ask the host for their IP address.
       Windows host: run  ipconfig  -> IPv4 Address
       Mac host    : System Settings > Network
  2. Double-click Join-Windows.cmd  (or Join-Mac.command).
  3. Enter the host's IP and a player name.
  4. The game launches and connects.

Same house / Wi-Fi: the local IP (like 192.168.x.x) is enough.
Over the internet: the host must port-forward TCP 8843 on
their router, and joiners use the host's public IP.


------------------------------------------------------------
  TROUBLESHOOTING
------------------------------------------------------------
* Game opens but no one else appears:
    - Check the relay window is still open on the host.
    - Re-check the host IP and that TCP 8843 is reachable
      (firewall / router).
* "Node.js is not installed" on the host:
    - Install it from https://nodejs.org/ and retry.
* Mac: "no Flash player found":
    - Put your Flash player in this folder as Flash Player.app
* The session (story + shared box) is remembered in
  relay/world.json on the host. Delete that file to start the
  shared world fresh.

Have fun.
