#!/usr/bin/env zsh
set -Eeuo pipefail

if ! command -v brew &> /dev/null
then
    echo "--- Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "--- Homebrew already installed"
fi
brew shellenv > $HOME/.zshrc
source $HOME/.zshrc

## check if .homebew.zsh exists
#if [ ! -f $HOME/.homebrew.zsh ]; then
#  echo "eval $(brew shellenv)" >> $HOME/.homebrew.zsh
#fi
#
## check if .homebrew.zsh is sourced in .zshrc
#if ! grep -qxF "source \$HOME/.homebrew.zsh" $HOME/.zshrc; then
#  echo "source \$HOME/.homebrew.zsh" >> $HOME/.zshrc
#fi
#
#eval $(brew shellenv)
#
#brew upgrade


# check if we're running on arm64 or x86_64
# if [[ $(uname -m) == "arm64" ]]; then
# else
# fi



# echo 'eval $(brew shellenv)' > $HOME/.zprofile
# eval $(brew shellenv)

# brew upgrade

# SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# brew bundle --file=$SCRIPT_DIR/Brewfile


