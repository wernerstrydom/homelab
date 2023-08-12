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
if [ -f "$HOME/.zshrc" ]; then
    cp $HOME/.zshrc $BACKUP_DIR/zshrc
fi
if [ -f "$HOME/.zshenv" ]; then
    cp $HOME/.zshenv $BACKUP_DIR/zshenv
fi
if [ -f "$HOME/.zprofile" ]; then
    cp $HOME/.zprofile $BACKUP_DIR/zprofile
fi


# Backup bash
echo "--- Backing up bash config"
if [ -f "$HOME/.bashrc" ]; then
    cp $HOME/.bashrc $BACKUP_DIR/bashrc
fi
if [ -f "$HOME/.bash_profile" ]; then
    cp $HOME/.bash_profile $BACKUP_DIR/bash_profile
fi

# Backup the aliases
echo "--- Backing up aliases"
alias > $BACKUP_DIR/alias

# Backup the VSCode settings
echo "--- Backing up Visual Studio Code"
if [ -d "$HOME/Library/Application\ Support/Code/User" ]; then
    mkdir -p $BACKUP_DIR/User
    cp -r $HOME/Library/Application\ Support/Code/User $BACKUP_DIR/User
fi

# Backup the VSCode extensions
# check if code is installed, and if it is, back up the extensions
if command -v code >/dev/null 2>&1; then
    echo "--- Backing up Visual Studio Code extensions"
    code --list-extensions > $BACKUP_DIR/vscode-extensions
fi

# Backup Terraform
echo "--- Backing up Terraform"
if [ -d "$HOME/.terraform.d" ]; then
    cp -r $HOME/.terraformrc $BACKUP_DIR/terraformrc
fi

# Backup Git
echo "--- Backing up Git"
if [ -f "$HOME/.gitconfig" ]; then
    cp $HOME/.gitconfig $BACKUP_DIR/gitconfig
fi
if [ -f "$HOME/.gitignore_global" ]; then
    cp $HOME/.gitignore_global $BACKUP_DIR/gitignore_global
fi

