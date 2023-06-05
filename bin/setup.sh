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

info "Setting up device..."

# Install homebrew
if ! [ -x "$(command -v brew)" ]; then
    info "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ $? -eq 0 ]; then
        success "Homebrew installation completed successfully."
    else
        error "Failed to install Homebrew."
        exit 1
    fi
else
    success "Homebrew is already installed."
fi

# Brew Packages
declare -a brewpkgs=(
    helix # editor
    shfmt # formatter for bash scripts
)
