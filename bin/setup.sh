#!/bin/bash

# Flags and Arguments
SKIP_BREW_PKGS=false

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
    --skip-brew-pkgs)
        SKIP_BREW_PKGS=true
        shift
        ;;
    esac
done

# Function to install brew packages
install_brew_pkgs() {
    # Brew Packages
    declare -a brewpkgs=(
        zsh      # shell
        starship # prompt
        tmux

        openssl@3 # core utils
        gnupg
        gnupg2 # github commit signature

        direnv # env var manager

        # Python
        pyenv
        pyenv-virtualenv
        pipx

        htop    # process monitor
        exa     # ls replacement
        ripgrep # grep replacement

        fzf # fuzzy file finder

        helix # editor
        shfmt # formatter for bash scripts

        # Java / Scala
        openjdk@17
        scala
        sbt

        # Databases
        mysql@8.0
        postgresql@14
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

            result=$?
            if [ $result -ne 0 ]; then
                error "Error: failed to install ${pkg}"
                exit 1
            else
                success "Installed ${pkg}"
            fi
        fi

    done
}

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

if [[ $SKIP_BREW_PKGS == false ]]; then
    install_brew_pkgs
fi

DOTFILES_DIR=$HOME/dotfiles # TODO: Configure the dotfiles here
# Symlink
git -C "$DOTFILES_DIR" pull || git clone https://github.com/mhetrerajat/dotfiles.git "$DOTFILES_DIR"
declare -a dotfiles=(
    starship.toml
)

for file in ${dotfiles[@]}; do
    dotfile_path=$HOME/.config/"$file"
    if [[ ! -e $dotfile_path ]]; then
        ln -s "$DOTFILES_DIR/$file" $dotfile_path
        success "${dotfile_path} symlink created"
    else
        info "${dotfile_path} symlink already exists"
    fi
done

## tmux
# Install tmux plugin manager
TMUX_DIR="$HOME/.config/tmux"
TPM_DIR="$TMUX_DIR/plugins/tpm"
if [ ! -d $TPM_DIR ]; then
    echo "Installing tnpm"
    git clone https://github.com/tmux-plugins/tpm $TPM_DIR
else
    info "tmux plugin manager is already installed"
fi

## fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Python
pyenv install 3.10.6
pyenv global 3.10.6
pip install --upgrade pip
pipx install ipython
pipx install black

# Rust
if ! [ -x "$(command -v rustc)" ]; then
    echo "Setup Rust Environment"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
