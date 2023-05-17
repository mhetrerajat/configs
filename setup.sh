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
brewCaskIn "Dropbox" dropbox
brewCaskIn "Tor Browser" tor-browser
brewCaskIn "Outlook" microsoft-outlook
brewCaskIn "Alacritty" alacritty
brewCaskIn "VLC" vlc

# Core Utils
brewIn openssl@3

# Shell / Terminal Configs
brewIn zsh
brewIn helix
brewIn just

# Github Commit Signature Dependencies
brewIn gnupg
brewIn gnupg2


## tmux
# Install tmux plugin manager
TMUX_DIR="$HOME/.config/tmux"
TPM_DIR="$TMUX_DIR/plugins/tpm"
if [ ! -d $TPM_DIR ]; then
	echo "Installing tnpm"
	git clone https://github.com/tmux-plugins/tpm $TPM_DIR
else
  echo "tmux plugin manager is already installed"
fi

## fzf
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install


# Python
brewIn pyenv
brewIn pyenv-virtualenv
pyenv install 3.10.6
pyenv global 3.10.6
pip install --upgrade pip
pip install ipython

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

# Java / Scala
brewIn openjdk@17
brewIn scala
brewIn sbt

# Databases
brewIn mysql@8.0
brewIn postgresql@14

# TUI Customizations
if ! [ -x "$(command -v omz)" ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

read -p "Do you want to replace ~/.zshrc config [N/y]? " -n 1 -r
echo # (optional) move to a new line
if [[ $REPLY =~ ^[y]$ ]]; then
	curl https://raw.githubusercontent.com/mhetrerajat/configs/master/oh_my_zsh/.zshrc --output ~/.zshrc
fi

# Frameworks
brewIn apache-spark

# Helix Editor Configs
cp -r helix ~/.config/

brew install helix
brew install --cask spotify
brew install --cask discord

# Node Js
brewIn node
