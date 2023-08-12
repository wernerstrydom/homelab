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
. ./system/utils/setup.sh

. ./apps/msoffice/setup.sh
. ./apps/1password/setup.sh

. ./system/ssh/setup.sh

. ./lang/c/setup.sh
. ./lang/go/setup.sh
. ./lang/python/setup.sh
. ./lang/javascript/setup.sh
. ./lang/ruby/setup.sh
. ./lang/kotlin/setup.sh
. ./lang/ldb-mi/setup.sh

. ./apps/github/setup.sh
. ./apps/git/setup.sh

. ./shell/ksh/setup.sh
. ./shell/bash/setup.sh

. ./apps/terraform/setup.sh

. ./apps/nano/setup.sh
. ./apps/vscode/setup.sh
. ./apps/jetbrains/setup.sh

. ./apps/elgato/setup.sh
. ./apps/hazel/setup.sh
