#!/usr/bin/env bash

set -e

DEST="$HOME/.local/bin"
FILE="wl-bright"

echo "[wl-bright] installing to $DEST..."

# ensure source file exists
if [ ! -f "$FILE" ]; then
    echo "[wl-bright] error: '$FILE' not found in current directory"
    exit 1
fi

mkdir -p "$DEST"

cp "$FILE" "$DEST/$FILE"
chmod +x "$DEST/$FILE"

echo "[wl-bright] installed successfully"

# check if DEST is in PATH
if [[ ":$PATH:" == *":$DEST:"* ]]; then
    echo "[wl-bright] ready: use 'wl-bright'"
    exit 0
fi

echo "[wl-bright] warning: $DEST not in PATH"
echo

# detect shell config file
SHELL_NAME="$(basename "$SHELL")"

case "$SHELL_NAME" in
    zsh)  RC="$HOME/.zshrc" ;;
    bash) RC="$HOME/.bashrc" ;;
    *)    RC="your shell config file" ;;
esac

echo "[wl-bright] add this line to $RC:"
echo
echo "  export PATH=\"$DEST:\$PATH\""
echo
echo "[wl-bright] then reload shell:"
echo "  source $RC"
