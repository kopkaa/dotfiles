export TERM=cygwin
DIR="$(dirname "$(readlink ~/.bashrc)")"

for file in "$DIR"/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

print_aliases() {
  echo -e "\n\e[1;34mAliases:\e[0m\n"

  echo -e "\e[1;32mGeneral:\e[0m"
  printf "  %-15s -> %s\n" "chrome-no-cors" "Start chrome without cors "
  printf "  %-15s -> %s\n" "gc" "git checkout"
  printf "  %-15s -> %s\n" "pr" "cd ~/Documents/Projects"
  printf "  %-15s -> %s\n" "edit-hosts" "Open /etc/hosts for editing"

  # echo -e "\n\e[1;32mBonu:\e[0m"
  # printf "  %-15s -> %s\n" "bonu:front" "cd to Bonu frontend and run dev"
  # printf "  %-15s -> %s\n" "bonu:admin" "cd to Bonu admin and run dev"

  echo -e "\n\e[1;32mIceWarp:\e[0m"
  printf "  %-15s -> %s\n" "iw:compose" "Start IceWarp Docker Compose"
  printf "  %-15s -> %s\n" "iw:api" "Start IceWarp API service"
  printf "  %-15s -> %s\n\n" "iw:mergeapi" "Generate new public api def and move to api service"

  echo -e "\n\e[1;32mRepilot:\e[0m"
  printf "  %-15s -> %s\n" "repilot:dev" "cd to Repilot frontend and run dev"
  printf "  %-15s -> %s\n" "repilot:generate" "Generate translations for repilot"
    printf "  %-15s -> %s\n" "repilot:logs" "Show logs from PHP container"
  
  echo -e "\n"
}

print_aliases
