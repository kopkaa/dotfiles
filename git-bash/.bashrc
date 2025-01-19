export TERM=cygwin

for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

print_aliases() {
  echo -e "\n\e[1;34mAliases:\e[0m\n"

  echo -e "\e[1;32mGeneral:\e[0m"
  printf "  %-15s -> %s\n" "chrome-no-cors" "Start chrome without cors "
  printf "  %-15s -> %s\n" "gc" "git checkout"
  printf "  %-15s -> %s\n" "pr" "cd ~/Documents/Projects"

  echo -e "\n\e[1;32m32mBonu:\e[0m"
  printf "  %-15s -> %s\n" "bonu-front" "cd to Bonu frontend and run dev"
  printf "  %-15s -> %s\n" "bonu-admin" "cd to Bonu admin and run dev"

  echo -e "\n\e[1;32mIceWarp:\e[0m"
  printf "  %-15s -> %s\n" "iw-compose" "Start IceWarp Docker Compose"
  printf "  %-15s -> %s\n" "iw-api" "Start IceWarp API service"
  
  echo -e "\n"
}

print_aliases

