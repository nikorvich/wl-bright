#!/usr/bin/env bash

DEST="$HOME/.local/bin"
BIN="wl-bright"
STATE="$HOME/.local/bin/wl-bright_state"

echo "[wl-bright] removing..."

# remove binary
if [ -f "$DEST/$BIN" ]; then
    rm -f "$DEST/$BIN"
    echo "[wl-bright] removed binary"
else
    echo "[wl-bright] binary not found"
fi

# remove state (optional cleanup)
if [ -f "$STATE" ]; then
    rm -f "$STATE"
    echo "[wl-bright] removed state"
fi

echo "[wl-bright] done"
echo "[wl-bright] note: remove PATH entry manually if added"
