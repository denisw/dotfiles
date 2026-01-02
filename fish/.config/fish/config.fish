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
fish_add_path "$HOME/.cargo/bin"

# Go
fish_add_path "$HOME/go/bin"

# JBang
fish_add_path "$HOME/.jbang/bin"

# Mise
fish_add_path "$HOME/.local/share/mise/shims/"

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

# Use Neovim as $EDITOR if installed.
if type -q nvim
  set -x EDITOR nvim
end

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

