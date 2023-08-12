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

# check if /etc/zshenv exists, if not create it
if [ ! -f /etc/zshenv ]; then
    echo "--- Creating /etc/zshenv"
    sudo touch /etc/zshenv
fi

# check if /etc/zshenv has the HOMEBREW_PREFIX and PATH variables, if not add them
grep -qxF "export HOMEBREW_PREFIX=$(brew --prefix)" /etc/zshenv || echo "export HOMEBREW_PREFIX=$(brew --prefix)" | sudo tee -a/etc/zshenv
grep -qxF "export PATH=$(brew --prefix)/bin:\$PATH" /etc/zshenv || echo "export PATH=$(brew --prefix)/bin:\$PATH" | sudo tee -a/etc/zshenv

source /etc/zshenv
brew upgrade

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile


