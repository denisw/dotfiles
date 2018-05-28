# Enable case-insensitive tab completion
bind 'set completion-ignore-case on'

# Load git completion
source ~/.bashrc.d/vendor/git-completion.bash

# Load bash-completion on macOS
if [ $(uname -s) == Darwin ]; then
  bash_completion_dir="$(brew --prefix)/etc/bash_completion.d"
  if [ -d $bash_completion_dir ]; then
    for file in $(ls $bash_completion_dir); do
      source "$bash_completion_dir/$file"
    done
  fi
fi

# Add completion for Git aliases
__git_complete ga _git_add
__git_complete gapa _git_add
__git_complete gco _git_checkout
__git_complete gp _git_push
