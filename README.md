## Sync / Install

Dotfiles jsou spravovány pomocí **symlinků**, takže změny v repozitáři se okamžitě projeví v systému.

### Init

```bash
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/ssh/config ~/.ssh/config


### PowerShell 

```powershell
New-Item -ItemType SymbolicLink `
  -Path "C:\Users\janxh\.bashrc" `
  -Target "C:\Users\janxh\Documents\Projects\dotfiles\git-bash\.bashrc"