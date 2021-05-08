# Add colors to terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias cdp='cd ~/Projects'
alias cdc='cd ~/Projects/current'
alias k='kubectl'
alias dc='docker-compose'
alias d='docker'
alias trymodule='/Users/nmarchenko/.nvm/versions/node/v6.11.1/bin/trymodule'
alias helm='/Users/nmarchenko/.minibox/bin/helm'
alias minikube='/Users/nmarchenko/.minibox/bin/minikube'
alias railspry='bundle exec pry -r ./config/environment'
alias g="git"
alias gti="git"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -s"
git-rebase () {
  git stash
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git checkout master
  git pull origin master
  git checkout $BRANCH
  git rebase master
}

git-master () {
  git checkout master
  git pull origin master
}


source ~/.bash_prompt
