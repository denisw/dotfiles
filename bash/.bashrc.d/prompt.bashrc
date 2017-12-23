source ~/.bashrc.d/vendor/git-prompt.sh

BOLD=$(tput bold)
WHITE=$(tput setaf 15)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 6)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

PS1='${BOLD}${BLUE}\W${RESET}$(__git_ps1 " (${RED}${BOLD}%s${RESET})") \$${RESET} '
