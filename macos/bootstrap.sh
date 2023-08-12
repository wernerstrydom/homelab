#!/usr/bin/env zsh
echo "Running SUDO"
sudo -v

# check if DevToolsSecurity status is enabled, if not enable it
if [[ $(DevToolsSecurity -status) == "disabled" ]]; then
  echo "Enabling Developer mode"
  sudo DevToolsSecurity -enable
else
  echo "Developer mode is already enabled"
fi

. ./apps/xcode-cli/setup.sh
. ./apps/homebrew/setup.sh

. ./apps/msoffice/setup.sh
. ./apps/1password/setup.sh

. ./apps/c/setup.sh
. ./apps/go/setup.sh
. ./apps/python/setup.sh
. ./apps/javascript/setup.sh
. ./apps/ruby/setup.sh
. ./apps/kotlin/setup.sh

. ./apps/github/setup.sh
. ./apps/git/setup.sh

. ./apps/ksh/setup.sh
. ./apps/bash/setup.sh

. ./apps/terraform/setup.sh

. ./apps/nano/setup.sh
. ./apps/vscode/setup.sh
. ./apps/jetbrains/setup.sh

