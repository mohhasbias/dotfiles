#!/bin/sh
# Install beads (bd) from steveyegge/beads latest release
# run_once: chezmoi only executes this once per machine

set -e

BD_BIN="$HOME/.local/bin/bd"

if [ -x "$BD_BIN" ]; then
  echo "beads already installed: $($BD_BIN --version 2>&1 | head -1)"
  exit 0
fi

echo "Installing beads (bd)..."
mkdir -p "$HOME/.local/bin"

# Detect architecture
ARCH=$(uname -m)
case "$ARCH" in
  x86_64)  ARCH_SUFFIX="linux_amd64" ;;
  aarch64) ARCH_SUFFIX="linux_arm64" ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Get latest release version
VERSION=$(curl -s https://api.github.com/repos/steveyegge/beads/releases/latest | grep '"tag_name"' | cut -d'"' -f4 | sed 's/^v//')
echo "Latest beads version: $VERSION"

TMP=$(mktemp -d)
curl -Lo "$TMP/beads.tar.gz" "https://github.com/steveyegge/beads/releases/latest/download/beads_${VERSION}_${ARCH_SUFFIX}.tar.gz"
tar -xzf "$TMP/beads.tar.gz" -C "$TMP"
mv "$TMP/bd" "$BD_BIN"
chmod +x "$BD_BIN"
rm -rf "$TMP"

echo "Installed: $($BD_BIN --version 2>&1 | head -1)"
