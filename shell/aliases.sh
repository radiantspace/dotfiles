# npm useful aliases
alias ni="npm i"
alias nt="npm test"
alias ndev="npm run dev"
alias ndeploy="npm run deploy"
alias ndeployf="npm run deploy:full"
alias ndeployw="npm run deploy:workers"

# git useful aliases
alias gc="git commit"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gma="git checkout main"
alias gmg="git checkout main && git pull"
alias gms="git checkout master"
alias gmsg="git checkout master && git pull"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add -A"
alias gp="git pull"
alias gps="git push"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate --all"
alias gclean="git fetch --prune && git gc --prune=now --aggressive"

# git merge origin/main
alias gmom="git merge origin/main"
