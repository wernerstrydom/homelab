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

grep -qxF "export HOMEBREW_PREFIX=$(brew --prefix)" ~/.zshrc || echo "export HOMEBREW_PREFIX=$(brew --prefix)" >> $HOME/.zshenv
grep -qxF "export PATH=\$HOMEBREW_PREFIX/bin:\$PATH" ~/.zshrc || echo "export PATH=\$HOMEBREW_PREFIX/bin:\$PATH" >> $HOME/.zshenv
source $HOME/.zshenv
brew upgrade

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile