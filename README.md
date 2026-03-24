# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Branches

| Branch | What it provides |
|--------|-----------------|
| `lazyvim` | Neovim binary + LazyVim config (`~/.config/nvim/`) |
| `claude` | Claude Code CLI + beads (`bd`) + hooks wired via `~/.claude/settings.json` |

## Usage

Apply a specific profile to a machine:

```sh
# Install chezmoi (if not present)
BINDIR="$HOME/.local/bin" sh -c "$(curl -fsLS get.chezmoi.io)"

# Apply a profile
~/.local/bin/chezmoi init --apply --branch=lazyvim mohhasbias/dotfiles
~/.local/bin/chezmoi init --apply --branch=claude mohhasbias/dotfiles
```
