#!/usr/bin/env zsh
set -Eeuo pipefail
# check arch and the paths
if command -v brew >/dev/null 2>&1; then
    echo "--- Upgrading Homebrew"
    brew update
else
    echo "--- Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'eval $(brew shellenv)' > $HOME/.zprofile
eval $(brew shellenv)

brew upgrade

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile


