if status is-interactive
    # Commands to run in interactive sessions can go here
end


# set SHELL
set -gx SHELL (which fish)

fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin


# Environment Vars
set -gx LANG en_US.UTF-8

# Editor
set -gx EDITOR nvim
set -gx GIT_EDITOR $EDITOR


# GIT
set -gx GPG_TTY (tty)


# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
