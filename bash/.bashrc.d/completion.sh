# Enable case-insensitive tab completion
bind 'set completion-ignore-case on'

# Load git completion
source ~/.bashrc.d/vendor/git-completion.bash

# Load bash-completion on macOS
if [ $(uname -s) == Darwin ]; then
  bash_completion_path="$(brew --prefix)/etc/bash_completion"
  if [ -f $bash_completion_dir ]; then
    source "$bash_completion_path"
  fi
fi

# Add completion for Git aliases
__git_complete ga _git_add
__git_complete gapa _git_add
__git_complete gco _git_checkout
__git_complete gp _git_push
