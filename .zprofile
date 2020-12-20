#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"
export PATH="$PATH:/home/adam/.dotnet/tools"
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Default programs:
export EDITORn="nvim"
export TERMINAL="yakuake"
export BROWSER="chromium"
export READER="zathura"

#XDG vars
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

#Supported
export AZURE_CONFIG_DIR=$XDG_DATA_HOME/azure
export IDEA_PROPERTIES="${XDG_CONFIG_HOME}"/intellij-idea/idea.properties
export IDEA_VM_OPTIONS="${XDG_CONFIG_HOME}"/intellij-idea/idea.vmoptions
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc


# :# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx

setxkbmap -option 'caps:ctrl_modifier' # makes Caps another Ctrl
xcape -e 'Caps_Lock=Escape' # Caps is Esc when pressed by itself
