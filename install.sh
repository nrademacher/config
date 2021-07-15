#!/bin/sh

packages=(
  "anki"
  "bat",
  "calibre",
  "clang",
  "cmake",
  "deno",
  "docker",
  "github-cli",
  "go",
  "kitty",
  "lynx",
  "ripgrep",
  "tree",
  "ttf-fira-code",
  "zsh",
)

exists() {
  type "$1" &> /dev/null;
}

install_packages() {
  for p in "${packages[@]}"; do
    if hash "$p" 2>/dev/null; then
      echo "$p is installed"
    else
      echo "$p is not installed"
      sudo -S pacman -S "$1" || echo "$p failed to install"
      echo "---------------------------------------------------------"
      echo "Done "
      echo "---------------------------------------------------------"
    fi
  done
}


create_dir() {
  if [ ! -d "$1" ]; then
    echo "Creating $1"
    mkdir -p $1
  fi
}

# Might as well ask for password up-front, right?
echo "Starting install script, please grant me sudo access..."
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

install_packages || echo "failed to install packages"

# Build neovim from source
echo
echo "Building neovim from source..."
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Development
make CMAKE_INSTALL_PREFIX=$HOME/local/nvim install
ln -s $HOME/local/nvim /usr/local/bin
sudo make CMAKE_INSTALL_PREFIX=/opt/nvim install
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin
cd "$HOME" || exit
echo "---------------------------------------------------------"

# Set up docker
sudo usermod -a -G docker $USER
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

# Install n node version manager program
curl -L https://git.io/n-install | bash

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Get zsh plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/local/share/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/local/share/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions /usr/local/share/zsh-autosuggestions

echo "---------------------------------------------------------"
echo "Changing to zsh"
echo "---------------------------------------------------------"
chsh -s "$(which zsh)"

$DOTFILES/install

echo 'done'
echo "---------------------------------------------------------"
echo "All done!"
echo "Cheers"
echo "---------------------------------------------------------"

exit 0

