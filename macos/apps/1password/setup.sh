#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PREFIX=$(brew --prefix)

# extract the list of plugins from ~/.zshrc
plugins=$(grep -oP '(?<=plugins=\().*(?=\))' ~/.zshrc)

# check if 1password plugin is already in the list of plugins
if [[ $plugins == *"1password"* ]]; then
    echo "1password plugin is already in the list of plugins"
else
    echo "1password plugin is not in the list of plugins"
    sed -i '' 's/plugins=(/plugins=(\n  1password /' ~/.zshrc
fi