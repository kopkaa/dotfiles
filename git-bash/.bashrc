export TERM=cygwin
DIR="$(dirname "$(readlink ~/.bashrc)")"

for file in "$DIR"/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

myhelp() {
  echo -e "\n\e[1;34mAliases:\e[0m\n"

  echo -e "\e[1;32mGeneral:\e[0m"
  printf "  %-18s -> %s\n" "myhelp"         "Show this help"
  printf "  %-18s -> %s\n" "chrome-no-cors" "Start chrome without cors"
  printf "  %-18s -> %s\n" "gc"             "git checkout"
  printf "  %-18s -> %s\n" "gundo"          "Undo last commit (keep changes staged)"
  printf "  %-18s -> %s\n" "pr"             "cd ~/Documents/Projects"
  printf "  %-18s -> %s\n" "edit-hosts"     "Open hosts file in Sublime as admin"
  printf "  %-18s -> %s\n" "pwd-win"        "Print current dir as Windows path"

  echo -e "\n\e[1;32mKubernetes:\e[0m"
  printf "  %-18s -> %s\n" "kube:dev2"      "Switch kubectl to dev2 context"
  printf "  %-18s -> %s\n" "kube:stage"     "Switch kubectl to stage context"
  printf "  %-18s -> %s\n" "kube:local"     "Switch kubectl back to local context"

  echo -e "\n\e[1;32mIceWarp:\e[0m"
  printf "  %-18s -> %s\n" "iw:compose"     "Start IceWarp Docker Compose"
  printf "  %-18s -> %s\n" "iw:api"         "Start IceWarp API service"
  printf "  %-18s -> %s\n" "iw:mergeapi"    "Generate public api def and move to api service"

  echo -e "\n\e[1;32mRepilot:\e[0m"
  printf "  %-18s -> %s\n" "repilot:dev"    "cd to Repilot frontend and run dev"
  printf "  %-18s -> %s\n" "repilot:generate" "Generate translations for Repilot"
  printf "  %-18s -> %s\n" "repilot:logs"   "Tail PHP container logs (errors highlighted)"

  echo
}

# Only print on interactive shell start — keeps subshells / scripts clean.
[[ $- == *i* ]] && myhelp
