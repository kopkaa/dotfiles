# Sourced for every zsh invocation (interactive, non-interactive, login).
# Keeps nvm available in scripts, Makefiles, and IDE terminals — not just
# interactive shells (which is all .zshrc covers).

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pnpm global bins (`pnpm add -g`); guard keeps PATH clean in nested shells.
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
