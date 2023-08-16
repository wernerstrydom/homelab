#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

if ! grep -q "JetBrains/Toolbox/scripts" ~/.zshenv; then
  echo "export PATH=\$PATH:~/Library/Application\ Support/JetBrains/Toolbox/scripts" >> ~/.zshenv
fi

source ~/.zshenv

