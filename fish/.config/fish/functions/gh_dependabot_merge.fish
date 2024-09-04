function gh_dependabot_merge
  gh_dependabot_ready | xargs -n1 gh pr merge --squash --auto
end
