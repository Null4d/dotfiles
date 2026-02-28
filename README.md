# .Null4d

![Linux](https://img.shields.io/badge/Linux-FFA500?logo=linux&logoColor=black&labelColor=FFA500) ![Shell](https://img.shields.io/badge/Shell-121011?logo=gnu-bash&logoColor=white) ![History](https://img.shields.io/badge/History-RAM--only-FCC624?labelColor=red) [![MIT](https://img.shields.io/badge/MIT-green.svg)](./LICENSE)

zero trust, zero trace.

```
dotfiles/
├── identity/          # $ whoami      (shell, git, gpg, ssh, tmux)
├── apps/              # $ which       (alacritty, ranger, ripgrep)
├── theme/             # color source + generator
├── setup.sh           # $ ./setup.sh
└── uninstall.sh       # $ ./uninstall.sh
```

## install

```bash
git clone https://github.com/Null4d/dotfiles ~/dotfiles
cd ~/dotfiles && ./setup.sh
exec zsh
```

## uninstall

```bash
cd ~/dotfiles && ./uninstall.sh
```

## dependencies

### core

```bash
# debian/ubuntu
sudo apt install zsh git gnupg openssh-client

# arch
sudo pacman -S zsh git gnupg openssh

# fedora
sudo dnf install zsh git gnupg2 openssh-clients

# set default shell
chsh -s $(which zsh)
```

### tools

```bash
# debian/ubuntu
sudo apt install tmux fzf ripgrep xclip wl-clipboard rsync ranger curl wget xdg-utils zoxide lsd fontconfig alacritty

# arch
sudo pacman -S tmux fzf ripgrep xclip wl-clipboard rsync ranger curl wget xdg-utils zoxide lsd fontconfig alacritty

# fedora
sudo dnf install tmux fzf ripgrep xclip wl-clipboard rsync ranger curl wget xdg-utils zoxide lsd fontconfig alacritty

# from github/web
nvim          # https://github.com/neovim/neovim
delta         # https://github.com/dandavison/delta
gh            # https://github.com/cli/cli
gitleaks      # https://github.com/gitleaks/gitleaks
difftastic    # https://github.com/Wilfred/difftastic
```

### languages

> install with `--no-modify-path` or `PROFILE=/dev/null` to prevent shell config changes.

```bash
rust        # https://rustup.rs
go          # https://go.dev/dl
node        # https://github.com/nvm-sh/nvm (via nvm)
deno        # https://deno.land
bun         # https://bun.sh
ruby        # https://github.com/rbenv/rbenv (via rbenv)
lua         # https://luarocks.org
python      # https://github.com/pyenv/pyenv (via pyenv)
```
