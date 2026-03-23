#!/bin/sh
# Install Neovim v0.11+ from official release tarball
# run_once: chezmoi only executes this once per machine

set -e

NVIM_TARGET="$HOME/.local/opt/nvim-linux-x86_64"
NVIM_BIN="$HOME/.local/bin/nvim"

if [ -x "$NVIM_BIN" ]; then
  echo "neovim already installed: $($NVIM_BIN --version | head -1)"
  exit 0
fi

echo "Installing Neovim..."
mkdir -p "$HOME/.local/opt" "$HOME/.local/bin"

TMP=$(mktemp -d)
curl -Lo "$TMP/nvim.tar.gz" https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -C "$HOME/.local/opt" -xzf "$TMP/nvim.tar.gz"
rm -rf "$TMP"

ln -sf "$NVIM_TARGET/bin/nvim" "$NVIM_BIN"
echo "Installed: $($NVIM_BIN --version | head -1)"
