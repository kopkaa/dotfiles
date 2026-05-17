# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)
source $ZSH/oh-my-zsh.sh

# Source sibling .aliases and .functions from this file's directory.
# Resolves symlinks so it works when ~/.zshrc points at the dotfiles repo.
ZSHRC_DIR="${${(%):-%N}:A:h}"
for file in "$ZSHRC_DIR"/.{aliases,functions}; do
    [[ -r $file && -f $file ]] || continue
    source "$file"
done
