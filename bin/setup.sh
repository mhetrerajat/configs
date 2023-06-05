#!/bin/bash

datestamp=​$(date +​"%Y%m%d%H%M")

# colorize messages
# Define color codes
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)​
RESET=$(tput sgr0)

# Functions to print the colored messages
info() { echo ​"${YELLOW}${@}${RESET}"; }
success() { echo ​"${GREEN}${@}${RESET}"; }
error() { echo ​"${RED}${@}${RESET}" >&2; }

echo "Setting up device..."

# Install homebrew
if ! [ -x "$(command -v brew)" ]; then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ $? -eq 0 ]; then
        success "Homebrew installation completed successfully."
    else
        error "Failed to install Homebrew."
        exit 1
    fi
else
    info "Homebrew is already installed."
fi

# Brew Packages
declare -a brewpkgs=(
    helix # editor
    shfmt # formatter for bash scripts
)

info "Updating package list"
brew update

# Installing packages if they are not already installed
for pkg in ${brewpkgs[@]}; do
    echo "Checking ${pkg}"
    if brew list $pkg >/dev/null; then
        info "${pkg} is already installed"
    else
        brew install $pkg
    fi

    result=$?
    if [ $result -ne 0 ]; then
        error "Error: failed to install ${pkg}"
        exit 1
    else
        success "Installed ${pkg}"
    fi
done
