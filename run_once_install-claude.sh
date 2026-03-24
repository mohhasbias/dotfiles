#!/bin/sh
# Install Claude Code CLI via npm
# run_once: chezmoi only executes this once per machine

set -e

if command -v claude >/dev/null 2>&1; then
  echo "claude already installed: $(claude --version 2>&1 | head -1)"
  exit 0
fi

echo "Installing Claude Code (npm)..."
npm install -g @anthropic-ai/claude-code

echo "Installing Claude Code (native)..."
claude install

echo "Installed: $(claude --version 2>&1 | head -1)"
