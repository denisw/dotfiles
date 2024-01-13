###########################################################################
# Abbreviations
###########################################################################

# Git
abbr -a ga git add
abbr -a gapa git add --patch
abbr -a gc git commit
abbr -a gc! git commit --amend
abbr -a gco git checkout
abbr -a gd git diff
abbr -a gl git pull
abbr -a glog git log --oneline
abbr -a gp git push
abbr -a gp! git push --force-with-lease
abbr -a gr git rebase
abbr -a gst git status

###########################################################################
# PATH
###########################################################################

# Homebrew
fish_add_path /opt/homebrew/bin

# Cargo (Rust)
fish_add_path "$HOME/.cargo/env"

# n (Node.js)
if type -q n
    set -x N_PREFIX "$HOME/.n"
    fish_add_path "$N_PREFIX/bin"
end

# pip --user (Python)
fish_add_path "$HOME/Library/Python/3.11/bin"

# ~/bin
fish_add_path --append "$HOME/bin"

# ~/bin, ~/.local/bin
fish_add_path --append "$HOME/bin"
fish_add_path --append "$HOME/.local/bin"

###########################################################################
# Misc
###########################################################################

# Set XDG_CONFIG_HOME for those programs that expect it
set -x XDG_CONFIG_HOME "$HOME/.config"

# Use Starship (https://starship.rs) as prompt if available.
# Otherwise, use a similar, but less full-featured fallback.
if type -q starship
    starship init fish | source
else
    function fish_prompt
        fish_prompt_fallback
    end
end

# direnv
if type -q direnv
    direnv hook fish | source
end

