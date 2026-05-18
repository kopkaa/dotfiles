# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)
source $ZSH/oh-my-zsh.sh

# Source the shared layer first, then unix-specific overrides.
# `:A` resolves symlinks so it works when ~/.zshrc points at the dotfiles repo.
ZSHRC_DIR="${${(%):-%N}:A:h}"
for file in "$ZSHRC_DIR"/../shared/.{aliases,functions} "$ZSHRC_DIR"/.{aliases,functions}; do
    [[ -r $file && -f $file ]] || continue
    source "$file"
done

# Per-machine overrides — not tracked, edit on this host only.
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
