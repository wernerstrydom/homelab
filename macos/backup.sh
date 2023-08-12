#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Create a backup directory, with the date and time as the name
BACKUP_DIR=$SCRIPT_DIR/backup/$(date "+%Y-%m-%d-%H-%M-%S")
mkdir -p $BACKUP_DIR

# Backup the Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "--- Backing up Brewfile"
    brew bundle dump --force --file=$BACKUP_DIR/Brewfile
fi

# Backup the ksh config
echo "--- Backing up zsh config"
cp $HOME/.zshrc $BACKUP_DIR/zshrc
cp $HOME/.zshenv $BACKUP_DIR/zshenv
cp $HOME/.zprofile $BACKUP_DIR/zprofile

# Backup bash
echo "--- Backing up bash config"
cp $HOME/.bashrc $BACKUP_DIR/bashrc
cp $HOME/.bash_profile $BACKUP_DIR/bash_profile

# Backup the aliases
echo "--- Backing up aliases"
alias > $BACKUP_DIR/alias

# Backup the VSCode settings
echo "--- Backing up Visual Studio Code"
cp -r $HOME/Library/Application\ Support/Code/User $BACKUP_DIR/User
code --list-extensions > $BACKUP_DIR/vscode-extensions

# Backup Terraform
echo "--- Backing up Terraform"
cp -r $HOME/.terraformrc $BACKUP_DIR/terraformrc

# Backup Git
echo "--- Backing up Git"
cp -r $HOME/.gitconfig $BACKUP_DIR/gitconfig
cp -r $HOME/.gitignore_global $BACKUP_DIR/gitignore_global
