#!/usr/bin/env bash
# dotfiles uninstaller

set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

removed=0

unlink() {
  local dst="$1"
  if [[ -L "$dst" ]] && [[ "$(readlink -- "$dst")" == "$DOTFILES"* ]]; then
    rm -f -- "$dst" || { echo "  error: remove failed for $dst" >&2; return 1; }
    echo "  $dst"
    removed=$((removed+1))
  fi
}

echo "uninstall: $DOTFILES"
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

# ssh
unlink "$HOME/.ssh/config"

# gpg
unlink "$HOME/.gnupg/gpg.conf"
unlink "$HOME/.gnupg/gpg-agent.conf"

# tmux
unlink "$HOME/.tmux.conf"

# alacritty
unlink "$HOME/.config/alacritty/alacritty.toml"
unlink "$HOME/.config/alacritty/themes/pixiefloss.toml"

# ripgrep
unlink "$HOME/.config/ripgrep/config"

# ranger
unlink "$HOME/.config/ranger/rc.conf"

echo ""
echo "done. removed $removed symlinks."
