#!/usr/bin/env zsh
set -Eeuo pipefail

mkdir -p ~/.fonts

# Install Nerd Fonts
if [ ! -d ~/.fonts/nerd-fonts ]; then
  echo "Installing Nerd Fonts"
  git clone https://github.com/ryanoasis/nerd-fonts --depth=1 ~/.fonts/nerd-fonts
else
  echo "Nerd Fonts already installed"
  # Update Nerd Fonts
  pushd ~/.fonts/nerd-fonts
  git pull
  popd
fi

pushd ~/.fonts/nerd-fonts
sudo ./install.sh
popd