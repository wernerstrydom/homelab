#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

alias python=$(brew --prefix)/bin/python3
alias python3=$(brew --prefix)/bin/python3

grep -qxF 'alias python=$HOMEBREW_PREFIX/bin/python3' ~/.aliases || echo 'alias python=$HOMEBREW_PREFIX/bin/python3' >> ~/.aliases
grep -qxF 'alias pip=$HOMEBREW_PREFIX/bin/pip3' ~/.aliases || echo 'alias pip=$(brew --prefix)/bin/pip3' >> ~/.aliases

python3 -m pip install --upgrade pip