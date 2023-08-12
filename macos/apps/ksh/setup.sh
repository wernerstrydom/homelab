#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PATH=$(brew --prefix)
if [ "$SHELL" != "$HOMEBREW_PATH/bin/ksh" ]; then
    grep -qxF "$HOMEBREW_PATH/bin/ksh" /etc/shells || echo "$HOMEBREW_PATH/bin/ksh" | sudo tee -a /etc/shells
    chsh -s $HOMEBREW_PATH/bin/ksh
fi

if [ -d $HOME/.oh-my-zsh ]; then
    pushd $HOME/.oh-my-zsh
    git pull origin
    popd
else
    $HOMEBREW_PATH/bin/ksh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    pushd "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    git pull origin
    popd
else
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Set OKSH Plugins
sed -i '' '/^plugins=(.*/ s//plugins=\(git python 1password vscode github golang aws ansible zsh-autosuggestions\)/' "$HOME/.zshrc"