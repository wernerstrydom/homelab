#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PATH=$(brew --prefix)

brew unlink nano && brew link nano

alias nano=/opt/homebrew/bin/nano

grep -qxF "alias nano=$HOMEBREW_PATH/bin/nano" ~/.zshrc || echo "alias nano=$HOMEBREW_PATH/bin/nano" >> ~/.zshrc
grep -qxF "export EDITOR=$HOMEBREW_PATH/bin/nano" ~/.zshrc || echo "export EDITOR=$HOMEBREW_PATH/bin/nano" >> ~/.zshrc
grep -qxF 'export VISUAL="$EDITOR"' ~/.zshrc || echo 'export VISUAL="$EDITOR"' >> ~/.zshrc

# Enable Syntax Highlighting
touch ~/.nanorc
grep -qxF "include \"$HOMEBREW_PATH/share/nano/*.nanorc\"" ~/.nanorc || echo "include \"$HOMEBREW_PATH/share/nano/*.nanorc\"" >> ~/.nanorc

git config --global core.editor "$HOMEBREW_PATH/bin/nano"