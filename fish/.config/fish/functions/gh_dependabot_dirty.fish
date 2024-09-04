function gh_dependabot_dirty
  gh pr list \
    --json number,author,state\
    --jq (string join " " \
     '.[]' \
     '| select(.author.login == "app/dependabot")' \
     '| .number' \
    )
end
