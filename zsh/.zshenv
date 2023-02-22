# Initialize PATH
export PATH="/foo:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Read PATH additions from /etc/paths.d/
if [[ -d "/etc/paths.d" ]]; then
  for f in $(ls /etc/paths.d); do
    while IFS='' read -r line || [ -n "${line}" ]; do
      PATH="$PATH:$line"
    done < /etc/paths.d/$f
  done
fi

# Set $XDG_CONFIG_HOME, which some tools use as config location,
# for parity between macOS and Linux
export XDG_CONFIG_HOME="$HOME/.config"

# Homebrew
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# ASDF
if [[ -d "$HOME/.asdf/bin" ]]; then
  export PATH="$HOME/.asdf/bin:$PATH"
fi
if [[ -d "$HOME/.asdf/shims" ]]; then
  export PATH="$HOME/.asdf/shims:$PATH"
fi

# Cargo (Rust)
if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# Go
if [[ -d "$HOME/go/bin" ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi

# Poetry (Python)
if [[ -d "$HOME/.poetry/bin" ]]; then
  export PATH="$HOME/.poetry/bin:$PATH"
fi

# rbenv
if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi
if [[ -d "$HOME/.rbenv/shims" ]]; then
  export PATH="$HOME/.rbenv/shims:$PATH"
fi

# ~/bin
if [[ -d "$HOME/bin" ]]; then
  export PATH="$PATH:$HOME/bin"
fi

# ~/.local/bin
if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
