#!/usr/bin/env zsh
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
. ./development/xcode-cli/setup.sh
. ./system/homebrew/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Fonts"
echo "--------------------------------------------------------------------------------"
. ./fonts/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Shells and Terminals"
echo "--------------------------------------------------------------------------------"
. ./shell/zsh/setup.sh
. ./shell/bash/setup.sh
. ./shell/powershell/setup.sh

echo "--------------------------------------------------------------------------------"
echo "System Tools"
echo "--------------------------------------------------------------------------------"
. ./system/ssh/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Utilities"
echo "--------------------------------------------------------------------------------"
. ./system/utils/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Languages"
echo "--------------------------------------------------------------------------------"
#. ./lang/c/setup.sh
#. ./lang/go/setup.sh
#. ./lang/python/setup.sh
#. ./lang/javascript/setup.sh
#. ./lang/ruby/setup.sh
#. ./lang/kotlin/setup.sh
#. ./lang/java/setup.sh
#. ./lang/dotnet/setup.sh

# iterate through every directory in the lang directory, and run the setup.sh script
# if it exists
for lang in ./lang/*/; do
  if [ -f "$lang/setup.sh" ]; then
    echo "--- $lang"
    . $lang/setup.sh
  fi
done

echo "--------------------------------------------------------------------------------"
echo "Development Tools"
echo "--------------------------------------------------------------------------------"
. ./development/github/setup.sh
. ./development/git/setup.sh
. ./development/gitkraken/setup.sh
. ./development/kaleidoscope/setup.sh
. ./development/terraform/setup.sh
. ./development/ldb-mi/setup.sh
. ./development/docker/setup.sh
. ./development/checkov/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Editors"
echo "--------------------------------------------------------------------------------"
. ./apps/nano/setup.sh
. ./development/vscode/setup.sh
. ./development/jetbrains/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Applications"
echo "--------------------------------------------------------------------------------"
. ./apps/elgato/setup.sh
. ./apps/hazel/setup.sh
. ./apps/pandoc/setup.sh
. ./apps/msoffice/setup.sh
. ./apps/fusion-360/setup.sh
. ./apps/logitech/setup.sh
. ./apps/transmit/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Security"
echo "--------------------------------------------------------------------------------"
# installing 1Password last would allow us to configure 1password plugins for other
# applications
. ./apps/1password/setup.sh



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
  . ./system/settings/$script.sh
done

killall Finder  &> /dev/null
killall Dock  &> /dev/null




