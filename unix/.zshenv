# Sourced for every zsh invocation (interactive, non-interactive, login).
# Keeps nvm available in scripts, Makefiles, and IDE terminals — not just
# interactive shells (which is all .zshrc covers).

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
