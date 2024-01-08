# Homebrew
if test -d /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin
end

# Cargo (Rust)
if test -d "$HOME/.cargo/env"
    fish_add_path "$HOME/.cargo/env"
end

# n (Node.js)
if type -q n
    set -x N_PREFIX "$HOME/.n"
    fish_add_path "$N_PREFIX/bin"
end

# ~/bin
if test -d "$HOME/bin"
    fish_add_path --append "$HOME/bin"
end

# ~/.local/bin
if test -d "$HOME/.local/bin"
    fish_add_path --append "$HOME/.local/bin"
end

# direnv
if type -q direnv
    direnv hook fish | source
end
