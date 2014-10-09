#!/bin/bash

#Environment variables for development
# export JAVA_HOME=`/usr/libexec/java_home -v 1.7\*`

# PAHT : put '/usr/local/bin:' at the begining of path - remove all instances of ':/usr/local/bin' from path - echo the path to the user
export PATH=/usr/local/bin:$PATH
export PATH=${PATH//:\/usr\/local\/bin/}
echo PATH=$PATH

# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Pull in git-prompt.sh
. $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# Custom prompt, and if applicable, title includes git info
case $TERM in
  xterm*)
    PS1='\[\033]0;\u@\h\ \w$(__git_ps1 "(%s)")\007\[\033[00;36m\]\u@\h\[\033[00m\] \[\033[00;32m\]\w\[\033[00m\]$(__git_ps1 "\[\033[00;33m\](%s)\[\033[00m\]")$ '
    ;;
  *)
    PS1='\[\033[00;36m\]\u@\h\[\033[00m\] \[\033[00;32m\]\w\[\033[00m\]$(__git_ps1 "\[\033[00;33m\](%s)\[\033[00m\]")$ '
    ;;
esac
export PS1

# make bash autocomplete with up and down arrows
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# ls color to match linux ls command
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
