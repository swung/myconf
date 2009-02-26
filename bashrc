
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ..="cd .."
alias ...="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."


function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

function tagthis () { export "$@"=$(pwd); }

function parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"  
}

function parse_git_branch () {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

#PS1='[\u@\h \W]\$ '
export PS1='\u:\[\033[31;40m\]\W\[\033[0;33m\]$(parse_git_branch)\[\e[0m\]$ '
#export http_proxy="http://www-proxy.cn.oracle.com:80"
