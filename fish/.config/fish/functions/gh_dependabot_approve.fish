function gh_dependabot_approve
  gh_dependabot_ready | xargs -n1 gh pr review --approve
end
