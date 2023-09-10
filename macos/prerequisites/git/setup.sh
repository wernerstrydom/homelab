#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

git config --global credential.helper osxkeychain
git config --global init.defaultBranch main

USERNAME=$(id -F)
EMAIL=$(defaults read MobileMeAccounts Accounts | grep AccountID | cut -d \" -f2)
git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"

# add docker to oh-my-zsh plugins
if grep -Fxq "  git" ~/.zshrc
then
    echo "git is already in ~/.zshrc"
else
    echo "git is not in ~/.zshrc"
    sed -i '' 's/plugins=(/plugins=(\n  git/' ~/.zshrc
fi

# configure git template directory. If it doesn't exist, create it
if [ -d ~/.git-template ]
then
    echo "$HOME/.git-template already exists"
else
    echo "$HOME/.git-template does not exist"
    mkdir -p ~/.git-template/hooks
fi

git config --global init.templateDir ~/.git-template

