#!/usr/bin/env bash
# dotfiles symlink deployer

set -euo pipefail

_dotfiles="$(cd "$(dirname "$0")" && pwd)"
_backup="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")" || { echo "  error: mkdir failed for $dst" >&2; return 1; }
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mkdir -p "$_backup"
    mv -- "$dst" "$_backup/" || { echo "  error: backup failed for $dst" >&2; return 1; }
    echo "  backup: $dst -> $_backup/"
  fi
  ln -sf -- "$src" "$dst" || { echo "  error: link failed: $dst" >&2; return 1; }
  echo "  $dst"
}

echo "dotfiles: $_dotfiles"
echo ""

# root
ln -sfn "$_dotfiles" "$HOME/.dotfiles"
echo "  ~/.dotfiles"

# shell
link "$_dotfiles/identity/shell/.zshenv"    "$HOME/.zshenv"
link "$_dotfiles/identity/shell/.zshrc"     "$HOME/.zshrc"
link "$_dotfiles/identity/shell/.paths"     "$HOME/.paths"
link "$_dotfiles/identity/shell/.aliases"   "$HOME/.aliases"
link "$_dotfiles/identity/shell/.functions" "$HOME/.functions"

# git
link "$_dotfiles/identity/git/config"           "$HOME/.config/git/config"
link "$_dotfiles/identity/git/ignore"           "$HOME/.config/git/ignore"
link "$_dotfiles/identity/git/hooks/pre-commit" "$HOME/.config/git/hooks/pre-commit"

# gpg
link "$_dotfiles/identity/gpg/gpg.conf"       "$HOME/.gnupg/gpg.conf"
link "$_dotfiles/identity/gpg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"

# ssh
link "$_dotfiles/identity/ssh/config" "$HOME/.ssh/config"

# tmux
link "$_dotfiles/identity/tmux/tmux.conf" "$HOME/.tmux.conf"
link "$_dotfiles/identity/shell/git-status" "$HOME/.local/bin/git-status"

# theme
"$_dotfiles/theme/build"
link "$_dotfiles/theme/alacritty" "$HOME/.local/bin/theme"
mkdir -p "$HOME/.cache/dotfiles"
touch "$HOME/.cache/dotfiles/alacritty-host.toml" "$HOME/.cache/dotfiles/tmux-host.conf"

# alacritty
link "$_dotfiles/apps/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# ranger
link "$_dotfiles/apps/ranger/rc.conf" "$HOME/.config/ranger/rc.conf"

# ripgrep
link "$_dotfiles/apps/ripgrep/config" "$HOME/.config/ripgrep/config"

# permissions
chmod 700 "$HOME/.gnupg" 2>/dev/null || true
chmod 700 "$HOME/.ssh" 2>/dev/null || true
chmod +x "$_dotfiles/identity/git/hooks/pre-commit"
chmod +x "$_dotfiles/identity/shell/git-status"
chmod +x "$_dotfiles/theme/build"
chmod +x "$_dotfiles/theme/alacritty"
chmod +x "$_dotfiles/uninstall.sh"

echo ""
echo "done. reload: exec zsh"
