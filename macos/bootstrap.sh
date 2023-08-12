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
. ./development/xcode-cli/setup.sh
. ./system/homebrew/setup.sh
. ./system/utils/setup.sh

# Applications
. ./apps/msoffice/setup.sh
. ./apps/1password/setup.sh

# System Tools
. ./system/ssh/setup.sh

# Languages
. ./lang/c/setup.sh
. ./lang/go/setup.sh
. ./lang/python/setup.sh
. ./lang/javascript/setup.sh
. ./lang/ruby/setup.sh
. ./lang/kotlin/setup.sh
. ./lang/java/setup.sh

# Source Control
. ./development/github/setup.sh
. ./development/git/setup.sh

# Shells and Terminals
. ./shell/ksh/setup.sh
. ./shell/bash/setup.sh
. ./shell/powershell/setup.sh

# Development
. ./development/gitkraken/setup.sh
. ./development/kaleidoscope/setup.sh
. ./development/terraform/setup.sh
. ./development/ldb-mi/setup.sh
. ./development/docker/setup.sh
. ./development/checkov/setup.sh

# Editors
. ./apps/nano/setup.sh
. ./development/vscode/setup.sh
. ./development/jetbrains/setup.sh

# Applications
. ./apps/elgato/setup.sh
. ./apps/hazel/setup.sh
. ./apps/pandoc/setup.sh
