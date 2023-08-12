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
. ./apps/xcode-cli/setup.sh
. ./apps/homebrew/setup.sh
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
. ./lang/ldb-mi/setup.sh

# Source Control
. ./apps/github/setup.sh
. ./apps/git/setup.sh

# Shells and Terminals
. ./shell/ksh/setup.sh
. ./shell/bash/setup.sh

. ./apps/terraform/setup.sh

# Development
. ./development/gitkraken/setup.sh
. ./development/kaleidoscope/setup.sh

# Editors
. ./apps/nano/setup.sh
. ./apps/vscode/setup.sh
. ./apps/jetbrains/setup.sh


# Applications
. ./apps/elgato/setup.sh
. ./apps/hazel/setup.sh
