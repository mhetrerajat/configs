# Configure znap
# Download Znap, if it's not there yet.
[[ -r ~/znaprepo/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/znaprepo/znap
source ~/znaprepo/znap/znap.zsh  # Start Znap
zstyle ':znap:*' repos-dir ~/znaprepo/


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

# Autojump CLI
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
