# Term
export TERM=xterm-256color

. "$HOME/.cargo/env"

# System level binaries
export PATH="/usr/local/sbin:$PATH"

# OpenSSL
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# gettext - internationalization (i18n) and localization (l10n)
export PATH="/usr/local/opt/gettext/bin:$PATH"

# bison flags
export LDFLAGS="-L/usr/local/opt/bison/lib"
export PATH="/usr/local/opt/bison/bin:$PATH"


export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/ant@1.9/bin:$PATH"

# Mono
export MONO_GAC_PREFIX="/usr/local"

# Spark
export SPARK_HOME=/usr/local/Cellar/apache-spark/3.0.1/libexec

# Github Commit GPG
export GPG_TTY=$(tty)

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


# JDK - Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="/usr/local/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@17/include"

# Java/Scala Package Manager
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"

## Node Version Manager
## NOTE: Removed for FNM
#export NVM_DIR="$HOME/.nvm"
#  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Default Editor
export EDITOR=nvim

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Helix Editor
export HELIX_RUNTIME=$HOME/.config/helix/runtime



