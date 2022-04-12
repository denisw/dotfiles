# Disable autosuggestions
set -g fish_autosuggestion_enabled 0

# Git aliases
alias ga='git add'
alias gapa='git add --patch'
alias gc='git commit'
alias gc!='git commit --amend'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glog='git log --oneline'
alias gp='git push'
alias gp!='git push --force-with-lease'
alias gst='git status'

#
# PATH additions
#
# (Note that fish_add_path does not add directories that does not exist,
# so it is safe to use for directories that only exist on some systems.)

# Homebrew
fish_add_path --append --path /opt/homebrew/bin

# ASDF
fish_add_path --prepend --path ~/.asdf/shims

# Cargo (Rust)
fish_add_path --append --path ~/.cargo/bin

# Android SDK
fish_add_path --append --path ~/Library/Android/sdk/platform-tools

# ~/bin
fish_add_path --append --path ~/bin

