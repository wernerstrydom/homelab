#!/usr/bin/env zsh
set -Eeuo pipefail

# check whether we're running on arm64 or x86_64
if [[ $(uname -m) == "arm64" ]]; then
  HOMEBREW_PREFIX=/opt/homebrew
else
  HOMEBREW_PREFIX=/usr/local
fi

# check if $HOMEBREW_PREFIX/bin/brew exists
if [ ! -f $HOMEBREW_PREFIX/bin/brew ]; then
  echo "--- Installing Homebrew"
  arch amd64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "--- Homebrew already installed"
fi

# Updating Paths
echo "$HOMEBREW_PREFIX/bin" > paths
echo "$HOMEBREW_PREFIX/sbin" >> paths
cat /etc/paths >> paths
cat paths | uniq > uniq_paths
cat uniq_paths

# ensure this environment is up to date
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
