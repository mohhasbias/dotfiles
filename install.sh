#!/bin/sh
# Bootstrap script for GitHub Codespaces dotfiles feature.
# GitHub Codespaces clones this repo to ~/dotfiles and runs this script.
set -e

CHEZMOI="$HOME/.local/bin/chezmoi"

# Install chezmoi if missing
if ! command -v chezmoi >/dev/null 2>&1 && [ ! -x "$CHEZMOI" ]; then
  echo "Installing chezmoi..."
  BINDIR="$HOME/.local/bin" sh -c "$(curl -fsLS get.chezmoi.io)"
fi

# Apply dotfiles from the already-cloned repo
echo "Applying dotfiles..."
"$CHEZMOI" init --apply --source="$HOME/dotfiles"
echo "Done."
