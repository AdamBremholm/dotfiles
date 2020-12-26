# History in cache directory:
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

#load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

#run .xinitrc
#test -f "$HOME"/.xinitrc && . "$HOME"/.xinitrc

ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="agnoster"

DISABLE_AUTO_UPDATE="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode ssh-agent nvm)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh
