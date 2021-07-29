#!/bin/bash

packages=(
	"anki"
	"bat"
	"calibre"
	"clang"
	"cmake"
	"docker"
	"docker-compose"
	"feh"
	"firefox-developer-edition"
	"github-cli"
	"go"
	"lynx"
	"noto-fonts-emoji"
	"prettier"
	"ripgrep"
	"shellcheck"
	"shfmt"
	"spotifyd"
	"tmux"
	"tree"
	"virtualbox"
	"xclip"
	"yarn"
	"yq"
	"zsh"
	"zsh-autosuggestions"
	"zsh-syntax-highlighting"
)

aur_repos=(
	"brave"
	"libxft-bgra"
	"neovim-git"
	"nerd-fonts-fira-code"
	"spotify-tui"
	"system76-power"
	"ttyper"
)

function join_by() {
	local IFS="$1"
	shift
	echo "$*"
}

function build_and_install_aur_packages() {
	echo "Building and installing packages from AUR..."

	for repo in "${aur_repos[@]}"; do
		git clone https://aur.archlinux.org/"$repo".git
		cd $repo || exit
		makepkg
		sudo pacman -U $repo*
		cd "$HOME" || exit
		rm -r $repo
	done

	return 0
}

function install_packages() {
	echo "---------------------------------------------------------"
	echo "Installing packages..."

	sudo -S pacman -Syu
	local p=$(join_by " " "${packages[@]}")
	sudo -S pacman -S $p

	build_and_install_aur_packages

	return 0
}

function build_st() {
	echo "---------------------------------------------------------"
	echo "Building st from source..."

	git clone https://github.com/LukeSmithxyz/st
	cd st || exit
	make install
	cd "$HOME" || exit

	return 0
}

# function build_neovim() {
# 	echo "---------------------------------------------------------"
# 	echo "Building neovim from source..."

# 	git clone https://github.com/neovim/neovim.git
# 	cd neovim || exit
# 	make CMAKE_BUILD_TYPE=Development
# 	make CMAKE_INSTALL_PREFIX="$HOME"/.local/bin install
# 	sudo ln -s "$HOME"/.local/bin /usr/local/bin
# 	cd "$HOME" || exit
# 	rm -r neovim

# 	return 0
# }

function run_primary_installs() {
	echo "---------------------------------------------------------"
	echo "Running primary installs..."

	install_packages
	build_st
	# build_neovim

	return 0
}

function run_setup_config() {
	echo "---------------------------------------------------------"
	echo "Configuring setup..."

	# Set up docker
	sudo usermod -a -G docker "$USER"
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo chmod 666 /var/run/docker.sock

	# Start/enable spotifyd
	systemctl --user start spotifyd.service
	systemctl --user enable spotifyd.service

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

	"$DOTFILES"/install

	echo "---------------------------------------------------------"
	echo "Changing to zsh"
	echo "---------------------------------------------------------"
	chsh -s "$(which zsh)"

	return 0
}

function run_secondary_installs() {
	echo "---------------------------------------------------------"
	echo "Installing plugins and package managers..."

	echo "Installing packer.nvim (neovim package manager)"
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

	echo "Installing n (nodejs version manager)"
	curl -L https://git.io/n-install | bash

	echo "Installing fzf (CLI fuzzy finder)"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

	echo "Installing powerlevel10k (zsh prompt)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh/plugins/powerlevel10k

	echo "Installing tmux pomodoro timer"
	go get github.com/rwxrob/cmdbox-pomo/pomo

	return 0
}

function main() {
	echo "Warning: This will take a while."
	echo "You may want to get coffee or take a walk :)"
	echo "But first, please grant necessary sudo access for installs..."
	sudo -v

	# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &

	run_primary_installs
	run_setup_config
	run_secondary_installs

	echo "---------------------------------------------------------"
	echo "All done! Have fun"

	exit 0
}

main
