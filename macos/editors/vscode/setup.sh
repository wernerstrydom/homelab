#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile


if grep -Fxq "  vscode" ~/.zshrc
then
    echo "vscode is already in ~/.zshrc"
else
    echo "vscode is not in ~/.zshrc"
    sed -i '' 's/plugins=(/plugins=(\n  vscode/' ~/.zshrc
fi