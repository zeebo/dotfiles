export PS1="\h:\W \u$ "

alias gw='git add -u && git commit -m'
alias ls='ls -FlG'
alias gs='git status'
alias gl='git log --format=format:"%H %cn %s"'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/python:$PATH

export EDITOR='subl -w'

export WORKON_HOME=$HOME/Code/envs
source /usr/local/bin/virtualenvwrapper.sh

export BUP_DIR='/Volumes/Jupiter/bup/'

export GOROOT=~/Code/go
export GOARCH=amd64
export GOOS=darwin
export GOBIN=$GOROOT/bin
export GOPATH=~/Code/gopath:~/Code/Homework/master
export PATH=$GOBIN:~/Code/gopath/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export PATH=/Users/zeebo/Code/pear/bin:$PATH

source ~/Code/gocd/gocd_completion.sh