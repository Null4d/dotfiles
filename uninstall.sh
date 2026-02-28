#!/usr/bin/env bash
# dotfiles uninstaller

set -euo pipefail

_dotfiles="$(cd "$(dirname "$0")" && pwd)"

removed=0

unlink() {
  local dst="$1"
  if [[ -L "$dst" ]] && [[ "$(readlink -- "$dst")" == "$_dotfiles" || "$(readlink -- "$dst")" == "$_dotfiles/"* ]]; then
    rm -f -- "$dst" || { echo "  error: remove failed for $dst" >&2; return 1; }
    echo "  $dst"
    removed=$((removed+1))
  fi
}

echo "uninstall: $_dotfiles"
echo ""

# root
unlink "$HOME/.dotfiles"

# shell
unlink "$HOME/.zshenv"
unlink "$HOME/.zshrc"
unlink "$HOME/.paths"
unlink "$HOME/.aliases"
unlink "$HOME/.functions"

# git
unlink "$HOME/.config/git/config"
unlink "$HOME/.config/git/ignore"
unlink "$HOME/.config/git/hooks/pre-commit"

# gpg
unlink "$HOME/.gnupg/gpg.conf"
unlink "$HOME/.gnupg/gpg-agent.conf"

# ssh
unlink "$HOME/.ssh/config"

# tmux
unlink "$HOME/.tmux.conf"
unlink "$HOME/.local/bin/git-status"

# alacritty
unlink "$HOME/.config/alacritty/alacritty.toml"

# ranger
unlink "$HOME/.config/ranger/rc.conf"

# ripgrep
unlink "$HOME/.config/ripgrep/config"

rm -f "$HOME/.zcompdump"*

echo ""
echo "done. removed $removed symlinks."
