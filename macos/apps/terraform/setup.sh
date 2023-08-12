#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

# make sure .terraformrc exists in home directory
if [ -f $HOME/.terraformrc ]; then
    echo "Terraform config file exists"
else
    echo "Creating Terraform config file"
    cat <<EOF > $HOME/.terraformrc
plugin_cache_dir = "$HOME/.terraform.d/plugin-cache"
disable_checkpoint = true
provider_installation {
  dev_overrides {}
  direct {}
}
EOF
fi