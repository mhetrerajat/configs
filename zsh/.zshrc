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
znap function _pyenv pyenv 'eval "$( pyenv init - --path --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pyvenv pyvenv 'eval "$(pyenv virtualenv-init -)"'
compctl -K    _pyvenv pyvenv
            
znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

# Load custom functions
fpath+=~/.zfunc

