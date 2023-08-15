#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PREFIX=$(brew --prefix)

# add 1password to oh-my-zsh plugins
if grep -Fxq "1password" ~/.zshrc
then
    echo "1password is already in ~/.zshrc"
else
    echo "1password is not in ~/.zshrc"
    sed -i '' 's/plugins=(/plugins=(\n  1password/' ~/.zshrc
fi

