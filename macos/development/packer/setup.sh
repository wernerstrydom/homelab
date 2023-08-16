#!/usr/bin/env zsh
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

if grep -Fxq "  terraform" ~/.zshrc
then
    echo "terraform is already in ~/.zshrc"
else
    echo "terraform is not in ~/.zshrc"
    sed -i '' 's/plugins=(/plugins=(\n  terraform/' ~/.zshrc
fi