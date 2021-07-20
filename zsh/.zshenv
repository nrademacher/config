#!/usr/bin/zsh
#=======================================================================
#       ENV VARIABLES
#=======================================================================
export DOTFILES=$HOME/.dotfiles
export PROJECTS_DIR=$HOME/projects

export MANPATH="/usr/local/man:$MANPATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export SHELL="$(which zsh)"

export VISUAL="nvim"
export EDITOR="nvim"
export USE_EDITOR=$EDITOR

path+=(
  "/usr/local/bin"
  "$HOME/local/nvim/bin"
  "$HOME/.npm/bin"
  "$HOME/.local/bin"
)

if [ -d "$HOME/bin" ] ; then
  path+=("$HOME/bin")
fi

if which yarn >/dev/null; then
  path+=("$(yarn global bin)")
fi

# pages
if test -x /usr/bin/lesspipe; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

export LESS_TERMCAP_mb="[35m"
export LESS_TERMCAP_md="[33m"
export LESS_TERMCAP_me=""
export LESS_TERMCAP_se=""
export LESS_TERMCAP_so="[34m"
export LESS_TERMCAP_ue=""
export LESS_TERMCAP_us="[4m"

# go
if which go >/dev/null; then
  export GOPATH=$HOME/go
  path+=("$GOPATH/bin")
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

