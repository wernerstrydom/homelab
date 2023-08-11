#!/usr/bin/env zsh
set -Eeuo pipefail
# check arch and the paths
if command -v brew >/dev/null 2>&1; then
    echo "--- Upgrading Homebrew"
    brew update
else
    echo "--- Installing Homebrew"
    
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH=$(brew --prefix)/bin:$PATH
fi

grep -qxF "export PATH=$(brew --prefix)/bin:\$PATH" ~/.zshrc || echo "export PATH=$(brew --prefix)/bin:\$PATH" >> ~/.zshrc

brew untap homebrew/core
brew untap homebrew/cask

brew upgrade

PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$PATH/Brewfile
