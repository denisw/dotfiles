function gh_dependabot_all
  gh pr list \
    --json number,author,state\
    --jq (string join " " \
     '.[]' \
     '| .number' \
    )
end
