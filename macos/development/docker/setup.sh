#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

# add docker to oh-my-zsh plugins
if grep -Fxq "  docker" ~/.zshrc
then
    echo "docker is already in ~/.zshrc"
else
    echo "docker is not in ~/.zshrc"
    sed -i '' 's/plugins=(/plugins=(\n  docker/' ~/.zshrc
fi