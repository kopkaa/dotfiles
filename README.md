# dotfiles

Personal shell, editor, and Claude Code configuration.
Managed as **symlinks** so edits in this repo apply immediately — no sync step.

## Layout

```
dotfiles/
├── .editorconfig          editor defaults (indent, charset, EOL)
├── .gitconfig             git user + global config
├── .wslconfig             WSL2 resource limits
├── .windows-terminal.json Windows Terminal profiles
├── claude/                Claude Code config (CLAUDE.md, settings, statusline, commands)
├── git-bash/              .bashrc, .aliases, .functions for Git Bash on Windows
└── unix/                  .zshrc, .aliases, .functions for macOS / Linux / WSL
```

## Install

The pattern is the same everywhere: `~/.<file>` is a symlink into this repo.
Adjust `REPO` to wherever you cloned to.

### Git Bash (Windows) — via PowerShell

PowerShell needs admin rights to create symlinks (or enable Windows Developer Mode once).

```powershell
$REPO = "C:\Users\janxh\Documents\Projects\utils\dotfiles"

New-Item -ItemType SymbolicLink -Path "$HOME\.bashrc"       -Target "$REPO\git-bash\.bashrc"
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig"    -Target "$REPO\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$HOME\.editorconfig" -Target "$REPO\.editorconfig"
New-Item -ItemType SymbolicLink -Path "$HOME\.wslconfig"    -Target "$REPO\.wslconfig"

# Claude Code config (per-user)
New-Item -ItemType SymbolicLink -Path "$HOME\.claude\CLAUDE.md"             -Target "$REPO\claude\CLAUDE.md"
New-Item -ItemType SymbolicLink -Path "$HOME\.claude\settings.json"         -Target "$REPO\claude\settings.json"
New-Item -ItemType SymbolicLink -Path "$HOME\.claude\statusline-command.sh" -Target "$REPO\claude\statusline-command.sh"
New-Item -ItemType SymbolicLink -Path "$HOME\.claude\commands"              -Target "$REPO\claude\commands"
```

`.bashrc` auto-sources `.aliases` and `.functions` from the same directory by
resolving its own symlink — no extra wiring needed.

### macOS / Linux / WSL

```bash
REPO="$HOME/Documents/Projects/utils/dotfiles"

ln -s "$REPO/unix/.zshrc"       "$HOME/.zshrc"
ln -s "$REPO/.gitconfig"        "$HOME/.gitconfig"
ln -s "$REPO/.editorconfig"     "$HOME/.editorconfig"

# Claude Code config
mkdir -p "$HOME/.claude"
ln -s "$REPO/claude/CLAUDE.md"             "$HOME/.claude/CLAUDE.md"
ln -s "$REPO/claude/settings.json"         "$HOME/.claude/settings.json"
ln -s "$REPO/claude/statusline-command.sh" "$HOME/.claude/statusline-command.sh"
ln -s "$REPO/claude/commands"              "$HOME/.claude/commands"
```

`.zshrc` assumes oh-my-zsh is installed at `~/.oh-my-zsh` with the
`zsh-autosuggestions` and `zsh-syntax-highlighting` plugins.

## What you get

Run `myhelp` in a Git Bash shell to see the alias list at any time
(also auto-printed on each new interactive shell).

| Command | What it does |
|---------|--------------|
| `myhelp` | Print the aliases table |
| `pr` | `cd ~/Documents/Projects` |
| `gc` | `git checkout` |
| `gundo` | Undo last commit, keep changes staged |
| `pwd-win` | Print current dir as a Windows path (`cygpath -w`) |
| `chrome-no-cors` | Launch Chrome with web security disabled |
| `edit-hosts` | Open `hosts` file in Sublime as admin |
| `kube:dev2` / `kube:stage` / `kube:local` | Swap `KUBECONFIG` between contexts |
| `iw:help` | List IceWarp project shortcuts (`iw:compose`, `iw:api`, `iw:mergeapi`) |
| `repilot:help` | List Repilot project shortcuts (`repilot:dev`, `repilot:generate`, `repilot:logs`) |

Functions available in Git Bash (`git-bash/.functions`):

- `mkd <dir>` — create and cd into a directory
- `pg_dump_table <schema> <table>` — dump one Postgres table to a dated `.sql`
- `fs [path]` — total size of file or directory
- `tre [path]` — `tree` with hidden files, ignoring `.git` / `node_modules`
- `diff` — overrides system diff with `git diff --no-index --color-words`

## Per-machine overrides

Anything in this repo is shared across **all** machines. For per-host tweaks
(different `git user.email` at work, a hostname-specific alias, a path that
only exists on one laptop) use the **local override** pattern instead of
forking the shared files.

Three opt-in slots, each loaded only if the file exists on the current host:

| Override file | Loaded by | Loaded when |
|---|---|---|
| `~/.bashrc.local` | `git-bash/.bashrc` | last, after `.aliases` + `.functions` |
| `~/.zshrc.local` | `unix/.zshrc` | last, after `.aliases` + `.functions` |
| `~/.gitconfig.local` | `.gitconfig` via `[include]` | always (git ignores missing path silently) |

### How it works

The shared rc files end with a guarded `source`:

```bash
[ -r "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"   # git-bash
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"  # zsh
```

Because they're sourced **last**, any alias/function/env-var defined in the
local file wins over the shared definitions — last write wins in the shell.

For git, `[include] path = ~/.gitconfig.local` does the same — later keys
override earlier ones, so a `[user] email = …` in the local file replaces the
shared one.

### When to put something here vs. in the shared repo

- **Shared repo** — anything you want on every machine (aliases, helper
  functions, themes, default git config).
- **`*.local`** — anything machine-specific: work vs. personal email,
  hostname-dependent paths, secrets/tokens you don't want in git, one-off
  experiments before promoting to the repo.

### Example: work laptop with a different git identity

```ini
# ~/.gitconfig.local
[user]
    email = jan.hromadka@employer.com
```

```bash
# ~/.zshrc.local
export WORK_LAPTOP=1
alias vpn='sudo openconnect vpn.employer.com'
```

The `*.local` files are **not tracked** — they live only in `$HOME` on each
host. Nothing to gitignore (they aren't in the repo to begin with).

## Updating

```bash
cd "$REPO"
# Edit anything — changes take effect in the next shell.
# Reload current shell:
source ~/.bashrc   # git-bash
source ~/.zshrc    # macOS / Linux / WSL
```
