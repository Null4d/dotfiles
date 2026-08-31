# zshenv - first file zsh loads

# deduplicate PATH across shells
typeset -U PATH path
path=("$HOME/.local/bin" $path)

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export DOTFILES="$HOME/.dotfiles"

# xdg base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export DELTA_PAGER="less -FRX"

# security
umask 077
export SSH_ASKPASS=""
export SSH_ASKPASS_REQUIRE="never"
export TPM2_PKCS11_STORE="$HOME/.tpm2_pkcs11"

# history (zero disk trace)
export HISTFILE="/dev/null"
export HISTSIZE=0                              # .zshrc overrides for RAM recall
export SAVEHIST=0
export LESSHISTFILE="/dev/null"
export NODE_REPL_HISTORY=""
export DENO_REPL_HISTORY=""
export PYTHON_HISTORY="/dev/null"
export SQLITE_HISTORY="/dev/null"
export MYSQL_HISTFILE="/dev/null"
export PSQL_HISTORY="/dev/null"
export REDISCLI_HISTFILE="/dev/null"
export GDBHISTFILE=""
export R2_HISTORY="/dev/null"
export ZSH_COMPDUMP="/dev/null"
export NVIM_LOG_FILE="/dev/null"
export _ZO_EXCLUDE_DIRS="/dev/shm/*"

# telemetry
export DO_NOT_TRACK=1
