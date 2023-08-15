#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

if grep -Fxq "  gh" ~/.zshrc
then
    echo "gh is already in ~/.zshrc"
else
    echo "gh is not in ~/.zshrc"
    sed -i '' 's/plugins=(/plugins=(\n  gh/' ~/.zshrc
fi