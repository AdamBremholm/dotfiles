# History in cache directory:
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd

#load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

#autostart tmux
if command -v tmux >/dev/null 2>&1; then
    # if not inside a tmux session, and if no session is started, start a new session
    [ -z "${TMUX}" ] && (tmux attach >/dev/null 2>&1 || tmux)
fi

export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet

#load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode ssh-agent docker)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh

if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh
