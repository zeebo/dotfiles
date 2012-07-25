export PS1="\h:\W \u$ "

alias gw='git add -u && git commit -m'
alias ls='ls -FlG'
alias gs='git status'
alias gl='git log --format=format:"%H %cn %s"'

export GOROOT=/usr/local/go
export GOPATH=/usr/local/gopath:$HOME/Code/go:/Volumes/Saturn/Code/go

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH+=:$(echo $GOROOT:$GOPATH/bin | sed s#:#/bin:#g)

export EDITOR='subl -w'
export BUP_DIR='/Volumes/Jupiter/bup/'

[[ -s "$HOME/.rvm/scripts/rvm" ]]              && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/.gocd/gocd_completion.sh" ]]      && source $HOME/.gocd/gocd_completion.sh

print_git_branch ()
{
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
	else
		return 0
	fi
	echo -e "[${gitver}$(changes)] "
}

changes ()
{
	if git diff --quiet 2>/dev/null >&2 
	then
		echo -ne " "
	else
		echo -ne "*"
	fi
}

PS1='$(print_git_branch)\h:\W \u$ '
