#!/bin/bash
# Arcuz Co-op -- HOST (macOS)
cd "$(dirname "$0")" || exit 1

echo "============================================"
echo "  Arcuz Co-op  --  HOST"
echo "============================================"
echo

if ! command -v node >/dev/null 2>&1; then
  echo "ERROR: Node.js is not installed."
  echo "The host machine needs it to run the session relay."
  echo "Get it from https://nodejs.org/ then run this again."
  read -n1 -r -p "Press any key to close..."
  exit 1
fi

read -r -p "Your player name [Player1]: " PNAME
PNAME=${PNAME:-Player1}

# config: the host connects to the relay on its own machine
printf 'netHost=127.0.0.1&netPort=8843&netName=%s&netCellOn=on&netBcastOn=on&netAvOn=on&netEnemyOn=on&netStashOn=on&netVfxOn=on&netDbgOn=off' "$PNAME" > netcfg.txt

# Flash blocks network sockets for local files unless the folder is trusted.
TRUSTDIR="$HOME/Library/Preferences/Macromedia/Flash Player/#Security/FlashPlayerTrust"
mkdir -p "$TRUSTDIR"
echo "$(pwd)" > "$TRUSTDIR/arcuz-coop.cfg"

# locate a Mac Flash standalone player (see README)
PLAYER=""
for c in "./Flash Player.app" "/Applications/Flash Player.app"; do
  if [ -d "$c" ]; then PLAYER="$c"; break; fi
done
if [ -z "$PLAYER" ]; then
  echo "ERROR: no Mac Flash player found."
  echo "Put a standalone Flash player named 'Flash Player.app' in this folder."
  read -n1 -r -p "Press any key to close..."
  exit 1
fi

echo
echo "Starting the relay in a new Terminal window."
echo "KEEP that window open for the whole session (it is the server)."
osascript -e 'tell application "Terminal" to do script "cd \"'"$(pwd)"'\" && node relay/relay.js"' >/dev/null
sleep 2

echo "Launching the game..."
open -a "$(cd "$(dirname "$PLAYER")" && pwd)/$(basename "$PLAYER")" "$(pwd)/arcuz-net.swf"

echo
echo "--------------------------------------------"
echo " Other players join with your IP address."
echo " Find it in System Settings > Network."
echo " (for play over the internet, port-forward TCP 8843)"
echo "--------------------------------------------"
echo
read -n1 -r -p "Press any key to close this window..."
