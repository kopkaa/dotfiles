export TERM=cygwin

alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l -h'
alias df="df -h"
alias lt='ls --human-readable --size -1 -S --classify'
alias count_files='find . -type f | wc -l'
alias gc="git checkout"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"



alias deploy-test="./build.sh --build --skip-tests --push --deploy"
alias localdev="cd /c/Users/janxh/Documents/Projects/ydealapp/ydealapp-localdev && ./run_honza.sh"
alias frontend="cd /c/Users/janxh/Documents/Projects/ydealapp/ydealapp-cloud/frontend && npm run dev"
alias pg_dump_ydealapp='pg_dump -U postgres -n ydealapp > ydealapp_$(date +"%Y-%m-%d").sql'

function pg_dump_table() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: pg_dump_table <schema_name> <table_name>"
        return 1
    fi

    pg_dump -U postgres -t "${1}.${2}" > "${1}_$(date +"%Y-%m-%d")_${2}.sql"
}

