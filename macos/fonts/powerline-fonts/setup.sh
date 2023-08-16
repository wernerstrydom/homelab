#!/usr/bin/env zsh
set -Eeuo pipefail

mkdir -p ~/.fonts

# Install Powerline Fonts
if [ ! -d ~/.fonts/powerline ]; then
  echo "Installing Powerline Fonts"
  git clone https://github.com/powerline/fonts.git --depth=1 ~/.fonts/powerline
else
  echo "Powerline Fonts already installed"
  # Update Powerline Fonts
  pushd ~/.fonts/powerline
  git pull
  popd
fi

pushd ~/.fonts/powerline
sudo ./install.sh
popd