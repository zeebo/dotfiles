alias gw='git add -u && git commit -m'
alias ls='ls -FlG'
alias gs='git status'
alias gl='git log --format=format:"%H %cn %s"'

export PATH=$PATH:/usr/local/sbin

export EDITOR='subl -w'

export WORKON_HOME=$HOME/Code/envs
source /usr/local/bin/virtualenvwrapper.sh

export BUP_DIR='/Volumes/Jupiter/bup/'

export GOROOT=~/Code/go
export GOARCH=amd64
export GOOS=darwin
export GOBIN=$GOROOT/bin
export PATH=$GOBIN:$PATH
