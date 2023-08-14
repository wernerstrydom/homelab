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

# ---------------------------------------------------------------------------
# Update Global Paths
#
# This allows anyone logged in to use homebrew
# ---------------------------------------------------------------------------

# create a temporary file to store paths
touch paths

# check if $HOMEBREW_PREFIX/bin exists in /etc/paths, and if not, add it to paths
if ! grep -qxF "$HOMEBREW_PREFIX/bin" /etc/paths; then
  echo "$HOMEBREW_PREFIX/bin" >> paths
fi

# check if $HOMEBREW_PREFIX/sbin exists in /etc/paths, and if not, add it to paths
if ! grep -qxF "$HOMEBREW_PREFIX/sbin" /etc/paths; then
  echo "$HOMEBREW_PREFIX/sbin" >> paths
fi

# set a trap to delete the temporary files regardless of an error or not
trap 'rm -f paths uniq_paths' EXIT

# append the contents of /etc/paths to paths
cat /etc/paths >> paths

# remove duplicate entries from paths
cat paths | uniq > uniq_paths

# check if /etc/paths is different from uniq_paths, and if so, update /etc/paths
if ! cmp -s /etc/paths uniq_paths; then
  echo "--- Updating /etc/paths"
  sudo mv /etc/paths /etc/paths.bak
  sudo mv uniq_paths /etc/paths
else
  echo "--- /etc/paths already up to date"
fi

# ---------------------------------------------------------------------------
# Setting Profiles  (zshrc, bashrc, etc)
# ---------------------------------------------------------------------------
echo "--- Setting Profiles"

# check if $HOMEBREW_PREFIX/bin exists in ~/.zshrc, and if not, add it to ~/.zshrc
if ! grep -qxF "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" ~/.zshrc; then
  echo "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" >> ~/.zshrc
fi

# check if $HOMEBREW_PREFIX/bin exists in ~/.bashrc, and if not, add it to ~/.bashrc
if ! grep -qxF "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" ~/.bashrc; then
  echo "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" >> ~/.bashrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"