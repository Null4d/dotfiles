# zshrc

# source external configs
[ -f "$HOME/.paths" ]     && source "$HOME/.paths"
[ -f "$HOME/.aliases" ]   && source "$HOME/.aliases"
[ -f "$HOME/.functions" ] && source "$HOME/.functions"

# completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# prompt
autoload -Uz vcs_info
precmd() { vcs_info; export GPG_TTY=$(tty) }
zstyle ':vcs_info:git:*' formats '%b'
setopt PROMPT_SUBST

PROMPT='%F{blue}%~%f %F{yellow}${vcs_info_msg_0_}%f
%F{green}$%f '

# keybindings
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^k" up-line-or-beginning-search
bindkey "^j" down-line-or-beginning-search

# history (RAM-only)
HISTSIZE=888888
SAVEHIST=0
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# system
ulimit -n 2048

# safety
setopt NO_CLOBBER                              # prevent > overwrite (use >| to force)

# tools
# fzf
if [[ -o interactive ]] && [[ -t 0 && -t 1 ]] && command -v fzf &>/dev/null; then
  if fzf --zsh &>/dev/null; then
    eval "$(fzf --zsh)"
  else
    for d in /usr/share/fzf /usr/share/doc/fzf/examples /usr/share/fzf/shell ~/.fzf/shell; do
      [ -f "$d/key-bindings.zsh" ] && source "$d/key-bindings.zsh"
      [ -f "$d/completion.zsh" ]   && source "$d/completion.zsh"
    done
  fi
fi

# zoxide (stores visited dirs on disk)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# local overrides
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
