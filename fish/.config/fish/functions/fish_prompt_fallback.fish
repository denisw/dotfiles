# The prompt used if Starship (https://starship.rs/) is not installed.
function fish_prompt_fallback
    # Save the status of the last command.
    set -l last_status $status
    set -l prompt_status ""

    # The colors used in the prompt.
    set -l normal_color (set_color normal)
    set -l status_color (set_color red)
    set -l pwd_color (set_color -o cyan)
    set -l vcs_color (set_color -o purple)
    set -l arrow_color (set_color -o red)

    # Output the status of the last command if non-zero.
    if test $last_status -ne 0
        set prompt_status (printf " %s[%s]%s " $status_color $last_status $normal_color)
    end

    # Do not shorten any part of the current working directory.
    # As it is printed on its own line, we have space.
    set -lx fish_prompt_pwd_dir_length 0

    # If inside a Git workspace, only print the the path starting from the Git
    # workspace root (including root itself). For instance, if inside a directory
    # "~/src/project/doc", where "project" is a repository root directory, the
    # displayed path is "project/doc".
    set -l git_info (git rev-parse --show-toplevel --show-prefix 2>/dev/null)
    set -l git_root $git_info[1]
    set -l git_prefix $git_info[2]
    set -l pwd
    if test -n "$git_root"
        set -l repo_name (basename "$git_root")
        if test -n "$git_prefix"
            set pwd "$repo_name/$(string trim -c / "$git_prefix")"
        else
            set pwd "$repo_name"
        end
    else
        set pwd (prompt_pwd)
    end

    printf '\n%s%s%s%s%s\n%s❯%s ' \
        $pwd_color \
        "$pwd" \
        $vcs_color \
        (fish_vcs_prompt) \
        "$prompt_status" \
        $arrow_color \
        $normal_color
end
