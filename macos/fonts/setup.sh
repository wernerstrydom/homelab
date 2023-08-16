#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

mkdir -p ~/.fonts

# Install Powerline Fonts
if [ ! -d ~/.fonts/powerline ]; then
  echo "Installing Powerline Fonts"
  git clone https://github.com/powerline/fonts.git --depth=1 ~/.fonts/powerline
  pushd ~/.fonts/powerline
  sudo ./install.sh
  popd
else
  echo "Powerline Fonts already installed"
fi

# Install Nerd Fonts
if [ ! -d ~/.fonts/nerd-fonts ]; then
  echo "Installing Nerd Fonts"
  git clone https://github.com/ryanoasis/nerd-fonts --depth=1 ~/.fonts/nerd-fonts
  pushd ~/.fonts/nerd-fonts
  sudo ./install.sh
  popd
else
  echo "Nerd Fonts already installed"
fi