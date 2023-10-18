export TERM=cygwin

alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l -h'
alias df="df -h"
alias lt='ls --human-readable --size -1 -S --classify'
alias count='find . -type f | wc -l'
alias gc="git checkout"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"



alias deploy-test="./build.sh --build --skip-tests --push --deploy"

