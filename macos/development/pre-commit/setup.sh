#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

if [ -d ~/.git-template/hooks ]
then
    echo "~/.git-template/hooks already exists"
else
    echo "~/.git-template/hooks does not exist"
    mkdir -p ~/.git-template/hooks
fi

pre-commit init-templatedir ~/.git-template
