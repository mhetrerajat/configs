# Configure znap
# Download Znap, if it's not there yet.
[[ -r ~/znaprepo/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/znaprepo/znap
source ~/znaprepo/znap/znap.zsh  # Start Znap
zstyle ':znap:*' repos-dir ~/znaprepo/

# Enable Asynchronous compilation
# compiles scripts and functions in the background
zstyle ':znap:*' auto-compile no

# Theme / Prompt
# Starship
znap eval starship 'starship init zsh --print-full-init'
znap prompt


## Plugins Section
znap source marlonrichert/zsh-autocomplete

# Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

# Auto Suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history)
znap source zsh-users/zsh-autosuggestions

znap source mafredri/zsh-async
znap source ael-code/zsh-colored-man-pages

# Load custom alias
if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

# Git Autocomplete
# znap source git/git 'contrib/completion/git-completion.zsh'

# Java/Scala Package Manager
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Python & Pyenv
znap eval pyenv "pyenv init - --path --no-rehash"
znap eval pyvenv "pyenv virtualenv-init -"
            
# Load custom functions
# TODO: Fix the autoload
# fpath+=~/.zfunc

# Third party autocompletions
znap fpath _pip	'pip completion --zsh'
znap fpath _rustup  'rustup  completions zsh'
znap fpath _cargo   'rustup  completions zsh cargo'
znap fpath _fnm 'fnm completions --shell zsh'

# FNM - Fast Node Manager
znap eval fnm "fnm env --use-on-cd --version-file-strategy=recursive"

# Autojump CLI
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fzf autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv
znap eval _direnv "direnv hook zsh"
