#export LANG="en_US.UTF-8"
#export LC_COLLATE="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"
#export LC_MESSAGES="en_US.UTF-8"
#export LC_MONETARY="en_US.UTF-8"
#export LC_NUMERIC="en_US.UTF-8"
#export LC_TIME="en_US.UTF-8"
#export LC_ALL="en_US.UTF-8"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1='\w # '
export EDITOR='vim'

alias ls='ls --color'
alias fig='docker-compose'
alias machine='docker-machine'

function lgrep { ls | grep "$1"; }
export lgrep
alias lg=lgrep

export PATH=$PATH:$HOME/.local/bin
