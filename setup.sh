#!/bin/bash

# Force updates all packages if already exists
UPGRADE_PKGS=false

while getopts 'u:' FLAGS; do
	case "$FLAGS" in
	u)
		UPGRADE_PKGS=true
		;;
	?)
		# DO NOTHING
		;;
	esac
done

# Homebrew
if ! [ -x "$(command -v brew)" ]; then
	echo "Installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Utils
brewIn() {

	if brew ls --versions "$1"; then
		if $UPGRADE_PKGS == true; then
			echo "Upgrading $1"
			brew upgrade "$1"
		else
			echo "$1 package already exists"
		fi
	else
		echo "Installing $1"
		brew install "$1"
	fi
}

brewCaskIn() {
	if [[ ! -d "/Applications/$1.app" ]]; then
		echo "Install cask: $2"
		brew install --cask $2
	fi
}

# Apps
brewCaskIn "Firefox" firefox
brewCaskIn "Visual Studio Code" visual-studio-code

# Shell / Terminal Configs
brewIn zsh
brewIn neovim

# Github Commit Signature Dependencies
brewIn gnupg
brewIn gnupg2

# Python
brewIn pyenv
brewIn pyenv-virtualenv

# Rust
if ! [ -x "$(command -v rustc)" ]; then
	echo "Setup Rust Environment"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Common utils alternatives from Rust
cargo install ruget
brewIn exa
brewIn procs
brewIn ripgrep
brewIn starship

# TUI Customizations
if ! [ -x "$(command -v omz)" ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi