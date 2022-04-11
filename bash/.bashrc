# Read PATH additions from /etc/paths.d/
if [[ -d "/etc/paths.d" ]]; then
  for f in $(ls /etc/paths.d); do
    while IFS='' read -r line || [ -n "${line}" ]; do
      PATH="$PATH:$line"
    done < /etc/paths.d/$f
  done
fi

# Homebrew
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# ASDF
if [[ -d "$HOME/.asdf/shims" ]]; then
  export PATH="$HOME/.asdf/shims:$PATH"
fi

# Cargo (Rust)
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Poetry (Python)
if [[ -d "$HOME/.poetry/bin" ]]; then
  export PATH="$HOME/.poetry/bin:$PATH"
fi

# Rust
if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# ~/bin
if [[ -d "$HOME/bin" ]]; then
  export PATH="$PATH:$HOME/bin"
fi
