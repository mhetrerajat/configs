# Homebrew
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Utils
brewIn() { 
	echo "Installing/Upgrading $1"
	if brew ls --versions "$1"; then brew upgrade "$1"; else brew install "$1"; fi 
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

