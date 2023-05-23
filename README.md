## Remainder

Move a file or a directory

```shell
mv [OPTIONS] SOURCE DESTINATION
```

Create a symlink

```shell
ln -s SOURCE_FILE SYMBOLIC_LINK
```

Example

```shell
# inside ~/.config
mv nvim ~/.dotfiles

ln -s ~/.dotfiles/nvim nvim
```

## Add

Neovim (don't forget to add .bash_aliases)

```shell
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

Kitty terminal

```shell
ln -s ~/.dotfiles/kitty ~/.config/kitty
```

Some aliases

```shell
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
```

Global gitignore

```shell
git config --global core.excludesfile ~/.dotfiles/.gitignore_global
```

Add git branch to bash prompt

```shell
CYAN='\[\e[1;36m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
nc='\[\e[0m\]'

# source /usr/lib/git-core/git-sh-prompt
source ~/.dotfiles/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=yes

PS1="$YELLOW\w$nc$CYAN\$(__git_ps1)$nc\\n$GREEN\$$nc "
```

VSCode

```bash
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s ~/.dotfiles/nvim/snips/javascript.json ~/.config/Code/User/snippets/javascript.json
```

Remap keys

```bash
mv swap.desktop ~/.config/autostart
```

```bash
chmod +x ~/.config/autostart/swap.desktop
```
