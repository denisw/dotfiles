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

# pip --user (Python)
if test -d "$HOME/Library/Python/3.11/bin"
    fish_add_path "$HOME/Library/Python/3.11/bin"
end

# ~/bin
if test -d "$HOME/bin"
    fish_add_path --append "$HOME/bin"
end

# ~/.local/bin
if test -d "$HOME/.local/bin"
    fish_add_path --append "$HOME/.local/bin"
end

###########################################################################
# Misc
###########################################################################

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

