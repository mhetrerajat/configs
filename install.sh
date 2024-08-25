#!/bin/bash



main() {

	# install homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# font
        brew install --cask font-jetbrains-mono --force

	# GIT
	brew install git gpg


	# install neovim
	brew install neovim


	# windows manager
	brew install --cask nikitabobko/tap/aerospace
}
