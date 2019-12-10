# PATH
export PATH="$PATH:/usr/local/bin:$HOME/bin"

# rbenv
if [[ -d "$HOME/.rbenv" ]]; then
  eval "$(rbenv init -)"
fi
