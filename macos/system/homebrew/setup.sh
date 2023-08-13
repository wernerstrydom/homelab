#!/usr/bin/env zsh
set -Eeuo pipefail

if ! command -v brew &> /dev/null
then
    echo "--- Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "--- Homebrew already installed"
fi

brew shellenv

# check if we're running on arm64 or x86_64
# if [[ $(uname -m) == "arm64" ]]; then
# else
# fi



# echo 'eval $(brew shellenv)' > $HOME/.zprofile
# eval $(brew shellenv)

# brew upgrade

# SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# brew bundle --file=$SCRIPT_DIR/Brewfile


