#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

git config --global credential.helper osxkeychain
git config --global init.defaultBranch main

USERNAME=`id -F`
EMAIL=$(defaults read MobileMeAccounts Accounts | grep AccountID | cut -d \" -f2)
git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"