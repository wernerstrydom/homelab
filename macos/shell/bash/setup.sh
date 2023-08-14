#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

# check if bash is already in /etc/shells
if grep -Fxq "$(brew --prefix)/bin/bash" /etc/shells
then
    echo "bash is already in /etc/shells"
else
    echo "bash is not in /etc/shells"
    echo $(brew --prefix)/bin/bash | sudo tee -a /etc/shells
fi
# chsh -s $(brew --prefix)/bin/bash