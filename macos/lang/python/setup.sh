#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

alias python=$(brew --prefix)/bin/python3
alias python3=$(brew --prefix)/bin/python3
grep -qxF "alias python=$(brew --prefix)/bin/python3" ~/.zshrc || echo "alias python=$(brew --prefix)/bin/python3" >> ~/.zshrc
grep -qxF "alias pip=$(brew --prefix)/bin/pip3" ~/.zshrc || echo "alias pip=$(brew --prefix)/bin/pip3" >> ~/.zshrc

python3 -m pip install --upgrade pip