# Set PATH
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# ASDF
if [[ -d "$HOME/.asdf/shims" ]]; then
  export PATH="$HOME/.asdf/shims:$PATH"
fi

# Cargo (Rust)
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Poetry
if [[ -d "$HOME/.poetry/bin" ]]; then
  export PATH="$HOME/.poetry/bin:$PATH"
fi


