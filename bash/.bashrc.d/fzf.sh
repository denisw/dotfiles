if [[ $(type -P fzf) && $(type -P fd) ]]; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi
