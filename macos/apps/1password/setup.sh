#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PREFIX=$(brew --prefix)

# add 1password to oh-my-zsh plugins
if grep -Fxq "  1password" ~/.zshrc
then
    echo "1password is already in ~/.zshrc"
else
    echo "1password is not in ~/.zshrc"
    sed -i '' 's/plugins=(/plugins=(\n  1password/' ~/.zshrc
fi

mkdir -p ~/.config/op
chmod 700 ~/.config/op
if [ ! -f ~/.config/op/config ]; then
    eval $(op signin)
fi
touch ~/.config/op/plugins.sh
chmod 600 ~/.config/op/plugins.sh
echo "source ~/.config/op/plugins.sh" >> ~/.zshrc && source ~/.zshrc

# add 1password to ~/.ssh/config if it doesn't exist
if grep -Fxq "2BUA8C4S2C.com.1password" ~/.ssh/config
then
    echo "1Password is already in ~/.ssh/config"
else
    echo "1Password is not in ~/.ssh/config"
    echo << EOF >> ~/.ssh/config
Host *
  IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
EOF
fi

