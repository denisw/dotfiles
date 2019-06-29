# Prompt
function fish_prompt
  set_color --bold $fish_color_param
  printf '%s' (basename (prompt_pwd))
  set_color normal

  echo -n (__fish_git_prompt)

  echo -n ' $ '
  set_color normal
end

# Git aliases
alias ga='git add'
alias gapa='git add --patch'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
