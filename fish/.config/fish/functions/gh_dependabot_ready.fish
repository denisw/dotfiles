function gh_dependabot_ready
  gh pr list \
    --json number,author,statusCheckRollup \
    --jq (string join " " \
     '.[]' \
     '| select(.author.login == "app/dependabot")' \
     '| select(all(.statusCheckRollup[]; .conclusion == "SUCCESS"))' \
     '| .number' \
    )
end
