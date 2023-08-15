#!/usr/bin/env zsh
echo "Running SUDO"
sudo -v

# backup
. ./backup.sh

# check if DevToolsSecurity status is enabled, if not enable it
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
. ./apps/1password/setup.sh

echo "--------------------------------------------------------------------------------"
echo "Languages"
echo "--------------------------------------------------------------------------------"
. ./lang/c/setup.sh
. ./lang/go/setup.sh
. ./lang/python/setup.sh
. ./lang/javascript/setup.sh
. ./lang/ruby/setup.sh
. ./lang/kotlin/setup.sh
. ./lang/java/setup.sh

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

echo "--------------------------------------------------------------------------------"
echo "Preferences"
echo "--------------------------------------------------------------------------------"
. ./system/settings/dock.sh
. ./system/settings/terminal.sh
