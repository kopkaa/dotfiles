export TERM=cygwin

for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

function pg_dump_table() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: pg_dump_table <schema_name> <table_name>"
        return 1
    fi

    pg_dump -U postgres -t "${1}.${2}" > "${1}_$(date +"%Y-%m-%d")_${2}.sql"
}

