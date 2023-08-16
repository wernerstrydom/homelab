#!/usr/bin/env zsh

set -Eeuo pipefail

# define a function that will iterate over all the directories in a given path, and
# execute the setup.sh script in each directory, while printing the name of the
# directory being installed.
#
# Allow the user to exclude directories by passing in a second argument. It will be
# used as follows
#
# install ./system
#
# Will install go through every child directory in system, and when setup.sh is found, it
# will execute it.
#
# If the user wants to exclude a directory, they can pass in a --exclude argument
# followed by a list of directories to exclude. For example:
#
# install ./system --exclude "settings" "homebrew"
#
# This will install everything in ./system except for ./system/settings and
# ./system/homebrew
#

function setup_dir {
  if [ -z "$1" ]; then
    echo "No path given"
    return 1
  fi

  if [ ! -d "$1" ]; then
    echo "Path $1 does not exist"
    return 1
  fi

  # iterate over all the directories in the given path
  for dir in "$1"/*/; do
    # get the name of the directory
    dir_name=$(basename "$dir")

    # check if the directory has a setup.sh script
    if [ -f "$dir/setup.sh" ]; then
      echo "Installing $dir_name"
      . "$dir/setup.sh"
    fi
  done
  return 0
}

echo "Running SUDO"
sudo -v

# backup
. ./backup.sh

echo "--------------------------------------------------------------------------------"
echo "Installing Rosetta"
echo "--------------------------------------------------------------------------------"
if [[ $(uname -m) == "arm64" ]]; then
  if /usr/bin/pgrep -q oahd; then
    echo "Rosetta already installed"
  else
    echo "Installing Rosetta"
    sudo softwareupdate --install-rosetta --agree-to-license
  fi
else
  echo "Not running on arm64, skipping Rosetta"
fi

# enable developer mode
echo "--------------------------------------------------------------------------------"
echo "Enabling Developer mode"
echo "--------------------------------------------------------------------------------"
if [[ $(DevToolsSecurity -status) == "disabled" ]]; then
  echo "Enabling Developer mode"
  sudo DevToolsSecurity -enable
else
  echo "Developer mode is already enabled"
fi

# Prerequisites
echo "--------------------------------------------------------------------------------"
echo "Prerequisites"
echo "--------------------------------------------------------------------------------"
. ./prerequisites/xcode-cli/setup.sh
. ./prerequisites/homebrew/setup.sh
. ./prerequisites/git/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Fonts"
echo "--------------------------------------------------------------------------------"
setup_dir ./fonts

echo "--------------------------------------------------------------------------------"
echo "Shells and Terminals"
echo "--------------------------------------------------------------------------------"
setup_dir ./shell

echo "--------------------------------------------------------------------------------"
echo "System Tools"
echo "--------------------------------------------------------------------------------"
# install everything in system except for settings and homebrew
setup_dir ./system

echo "--------------------------------------------------------------------------------"
echo "Languages"
echo "--------------------------------------------------------------------------------"
setup_dir ./lang

echo "--------------------------------------------------------------------------------"
echo "Development Tools"
echo "--------------------------------------------------------------------------------"
setup_dir ./development

echo "--------------------------------------------------------------------------------"
echo "Editors"
echo "--------------------------------------------------------------------------------"
setup_dir ./editors

echo "--------------------------------------------------------------------------------"
echo "Applications"
echo "--------------------------------------------------------------------------------"
setup_dir ./apps

echo "--------------------------------------------------------------------------------"
echo "Security"
echo "--------------------------------------------------------------------------------"
setup_dir ./security

echo "--------------------------------------------------------------------------------"
echo "Preferences"
echo "--------------------------------------------------------------------------------"

scripts=(
  appstore
  battery
  desktopservices
  dock
  finder
  loginwindow
  mail
  menubar
  networkbrowser
  photos
  preview
  safari
  screencapture
  sound
  system
  terminal
  textedit
  time
  timemachine
  universalaccess
)

for script in "${scripts[@]}"; do
  echo "Configuring $script"
  . ./settings/$script.sh
done

killall Finder  &> /dev/null
killall Dock  &> /dev/null




