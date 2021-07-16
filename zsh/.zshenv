#!/usr/bin/zsh
#=======================================================================
#       ENV VARIABLES
#=======================================================================
export DOTFILES=$HOME/.dotfiles
export PROJECTS_DIR=$HOME/projects

export MANPATH="/usr/local/man:$MANPATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export TERMINAL="kitty"

export VISUAL="nvim"
export EDITOR="nvim"
export USE_EDITOR=$EDITOR

path+=(
  "/usr/local/bin"
  "$HOME/.npm/bin"
  "$HOME/.local/bin"
)

if [ -d "$HOME/bin" ] ; then
  path+=("$HOME/bin")
fi

if which yarn >/dev/null; then
  path+=("$(yarn global bin)")
fi

# go
if which go >/dev/null; then
  export GOPATH=$HOME/go
  path+=("$GOPATH/bin")
fi


# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
