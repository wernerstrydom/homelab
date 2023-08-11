#!/usr/bin/env zsh
set -Eeuo pipefail
# check arch and the paths
if [ -d "/opt/homebrew/bin/" ] 
then
    echo "--- Upgrading Homebrew"
    brew update
else
    echo "--- Installing Homebrew"
    
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH=/opt/homebrew/bin:$PATH
fi
# $(brew --prefix)
grep -qxF "export PATH=$(brew --prefix)/bin:\$PATH" ~/.zshrc || echo "export PATH=$(brew --prefix)/bin:\$PATH" >> ~/.zshrc
brew upgrade
brew bundle
