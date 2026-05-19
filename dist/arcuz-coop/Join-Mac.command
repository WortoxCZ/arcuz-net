#!/bin/bash
# Arcuz Co-op -- JOIN (macOS)
cd "$(dirname "$0")" || exit 1

echo "============================================"
echo "  Arcuz Co-op  --  JOIN"
echo "============================================"
echo

read -r -p "Host IP address: " PHOST
if [ -z "$PHOST" ]; then
  echo "No address entered."
  read -n1 -r -p "Press any key to close..."
  exit 1
fi

read -r -p "Your player name [Player2]: " PNAME
PNAME=${PNAME:-Player2}

# config: connect to the host machine
printf 'netHost=%s&netPort=8843&netName=%s&netCellOn=on&netBcastOn=on&netAvOn=on&netEnemyOn=on&netStashOn=on&netVfxOn=on&netDbgOn=off' "$PHOST" "$PNAME" > netcfg.txt

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
echo "Launching the game, connecting to $PHOST ..."
open -a "$(cd "$(dirname "$PLAYER")" && pwd)/$(basename "$PLAYER")" "$(pwd)/arcuz-net.swf"
