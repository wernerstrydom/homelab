#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PREFIX=$(brew --prefix)

# add 1password to plugins in ~/.zshrc. The plugins line should may look like this:
# plugins=(
#   git
#   zsh-syntax-highlighting
# )
# and we want to add 1password to the end of the list
sed -i '' 's/plugins=(/plugins=(\n  1password\n/' ~/.zshrc
