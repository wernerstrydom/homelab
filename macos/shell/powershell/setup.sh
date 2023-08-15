#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

# check if pwsh is already in /etc/shells
if grep -Fxq "$(brew --prefix)/bin/pwsh" /etc/shells
then
    echo "pwsh is already in /etc/shells"
else
    echo "pwsh is not in /etc/shells"
    echo $(brew --prefix)/bin/pwsh | sudo tee -a /etc/shells
fi
