function fish_prompt
  set_color $fish_color_cwd
  printf '%s' (basename (prompt_pwd))
  set_color normal

  echo -n (__fish_git_prompt)

  echo -n ' $ '
  set_color normal
end
