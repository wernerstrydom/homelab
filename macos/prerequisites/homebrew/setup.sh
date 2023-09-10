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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "--- Homebrew already installed"
fi

# ---------------------------------------------------------------------------
# Setting Profiles  (zshrc, bashrc, etc)
# ---------------------------------------------------------------------------
echo "--- Setting Profiles"

# check if ~/.zshrc exists
if [ ! -f ~/.zshrc ]; then
  echo "--- Creating ~/.zshrc"
  touch ~/.zshrc
fi

# check if $HOMEBREW_PREFIX/bin exists in ~/.zshrc, and if not, add it to ~/.zshrc
if ! grep -qxF "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" ~/.zshrc; then
  echo "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" >> ~/.zshrc
fi

if [ ! -f ~/.bashrc ]; then
  echo "--- Creating ~/.bashrc"
  touch ~/.bashrc
fi

# check if $HOMEBREW_PREFIX/bin exists in ~/.bashrc, and if not, add it to ~/.bashrc
if ! grep -qxF "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" ~/.bashrc; then
  echo "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" >> ~/.bashrc
fi

eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

# /private/var/db/com.apple.xpc.launchd/config/user.plist
# sudo launchctl config user path "$HOMEBREW_PREFIX/bin:$PATH"
# sudo launchctl config system path "$HOMEBREW_PREFIX/bin:$PATH"



