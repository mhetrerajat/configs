#!/bin/bash



main() {

	# install homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


	# GIT
	brew install git gpg


	# install neovim
	brew install neovim


}
