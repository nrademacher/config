#!/bin/bash

packages=(
  "anki"
  "bat"
  "clang"
  "cmake"
  "deno"
  "docker"
  "github-cli"
  "kitty"
  "ripgrep"
  "tree"
  "ttf-fira-code"
  "zsh"
)

function join_by() {
  local IFS="$1"
  shift
  echo "$*"
}

function install_packages() {
  echo "---------------------------------------------------------"
  echo "Installing packages..."

  local p=$(join_by " " "${packages[@]}")
  sudo -S pacman -S $p

  return 0
}

# Build neovim from source
function build_neovim() {
  echo "---------------------------------------------------------"
  echo "Building neovim from source..."
  
  git clone https://github.com/neovim/neovim.git
  cd neovim || exit
  make CMAKE_BUILD_TYPE=Development
  make CMAKE_INSTALL_PREFIX="$HOME"/local/nvim install
  sudo ln -s "$HOME"/local/nvim /usr/local/bin

  cd "$HOME" || exit

  echo 'done'
  echo "---------------------------------------------------------"

  return 0
}

function run_primary_installs() {
  echo "Starting install script, please grant me sudo access..."
  sudo -v

  # Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  
  install_packages
  build_neovim

  return 0
}

function run_setup_config() {
  echo "---------------------------------------------------------"
  echo "Configuring setup..."

  # Set up docker
  sudo usermod -a -G docker "$USER"
  sudo systemctl start docker
  sudo systemctl enable docker

  # Clone my dotfiles repo into ~/.dotfiles/ if needed
  echo "dotfiles -------------------------------------------------"

  export DOTFILES="$HOME/.dotfiles"

  if [ -f "$DOTFILES" ]; then
    echo "Dotfiles have already been cloned into the home dir"
  else
    echo "Cloning dotfiles"
    git clone https://github.com/nrademacher/dotfiles.git ~/.dotfiles
  fi

  cd "$DOTFILES" || "Didn't cd into dotfiles this will be bad :("
  git submodule update --init --recursive

  cd "$HOME" || exit
  echo "---------------------------------------------------------"
  echo "You'll need to log out for this to take effect"

  echo "---------------------------------------------------------"
  echo "Changing to zsh"
  echo "---------------------------------------------------------"
  chsh -s "$(which zsh)"

  "$DOTFILES"/install

  return 0
}

function run_secondary_installs() {
  echo "---------------------------------------------------------"
  echo "Installing plugins and package managers..."

  echo "Installing packer.nvim (neovim package manager)"
  git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

  echo "Installing n (nodejs version manager)"
  curl -L https://git.io/n-install | zsh

  echo "Installing fzf (CLI fuzzy finder)"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install

  echo "Installing zsh plugins (powerlevel10k prompt, syntax highlighting, autosuggestions)"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/local/share/powerlevel10k
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/local/share/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions /usr/local/share/zsh-autosuggestions

  return 0
}

function main() {
  run_primary_installs
  run_setup_config
  run_secondary_installs

  echo "All done!"
  echo "Have fun"
  echo "---------------------------------------------------------"

  exit 0
}

main

