### General ###

# Colors
autoload -Uz colors
colors
export CLICOLOR=1

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list \
  'm:{a-z-}={A-Z_}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

# History
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
export HISTFILE=$HOME/.zsh_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Editor
export EDITOR=nvim

# Explicitly use emacs-style zsh bindings
# (required for tmux if EDITOR=vim is set)
bindkey -e

### Prompt ###

# Advanced prompt
autoload -Uz promptinit
promptinit

# Enable prompt substitution
setopt prompt_subst

# Version control info
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats "(%{$fg_bold[red]%}%b%{$reset_color%}) "

# Prompt definition
PROMPT='%{$fg_bold[cyan]%}%1~%{$reset_color%} ${vcs_info_msg_0_}%# '

### Aliases ###

# Git
alias ga='git add'
alias gapa='git add --patch'
alias gc!='git commit --amend'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glog='git log --oneline'
alias gp='git push'
alias gp!='git push --force-with-lease'
alias gr='git rebase'
alias gst='git status'

### Functions ###

set-title() {
  echo -n "\033]0;${1}\007"
}

### Bundles ###

source "$HOME/.zsh/antigen.zsh"
antigen apply

### Extras ###

# ASDF
if [[ -f /usr/local/opt/asdf/asdf.sh ]]; then
  . /usr/local/opt/asdf/asdf.sh
fi
