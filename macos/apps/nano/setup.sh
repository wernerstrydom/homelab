#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PREFIX=$(brew --prefix)

brew unlink nano && brew link nano

grep -qxF 'alias nano=$HOMEBREW_PREFIX/bin/nano' ~/.zshrc || echo 'alias nano=$HOMEBREW_PREFIX/bin/nano' >> ~/.zshrc
grep -qxF 'export EDITOR=$HOMEBREW_PREFIX/bin/nano' $HOME/.zshenv || echo 'export EDITOR=$HOMEBREW_PREFIX/bin/nano' >> $HOME/.zshenv
grep -qxF 'export VISUAL="$EDITOR"' $HOME/.zshenv || echo 'export VISUAL="$EDITOR"' >> $HOME/.zshenv

# Enable Syntax Highlighting
touch ~/.nanorc
grep -qxF "include \"$HOMEBREW_PREFIX/share/nano/*.nanorc\"" ~/.nanorc || echo "include \"$HOMEBREW_PREFIX/share/nano/*.nanorc\"" >> $HOME/.nanorc

git config --global core.editor "$HOMEBREW_PATH/bin/nano"

source $HOME/.zshenv
source $HOME/.zshrc
