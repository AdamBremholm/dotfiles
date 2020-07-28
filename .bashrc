#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
#export PATH="${PATH}:~/.cargo/bin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval `keychain --eval --agents ssh id_rsa`


#XDG vars
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

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

#load aliases
test -f "$XDG_CONFIG_HOME"/aliasrc && source "$XDG_CONFIG_HOME"/aliasrc

#run .xinitrc
test -f "$HOME"/.xinitrc && . "$HOME"/.xinitrc

#powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

#Starship
eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
