# The prompt used if Starship (https://starship.rs/) is not installed.
function fish_prompt_fallback
    # Save the status of the last command.
    # It will be printed if non-zero.
    set -l last_status $status
    set -l prompt_status ""

    # The colors used in the prompt.
    set -l normal_color (set_color normal)
    set -l status_color (set_color red)
    set -l pwd_color (set_color -o cyan)
    set -l vcs_color (set_color -o purple)
    set -l arrow_color (set_color -o red)

    # Do not shorten any part of the current working directory.
    # As it is printed on its own line, we have space.
    set -lx fish_prompt_pwd_dir_length 0

    if test $last_status -ne 0
        set prompt_status (printf " %s[%s]%s " $status_color $last_status $normal_color)
    end

    printf '\n%s%s%s%s%s\n%s❯%s ' \
        $pwd_color \
        (prompt_pwd) \
        $vcs_color \
        (fish_vcs_prompt) \
        "$prompt_status" \
        $arrow_color \
        $normal_color
end
