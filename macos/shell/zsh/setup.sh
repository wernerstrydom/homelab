#!/usr/bin/env zsh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PREFIX=$(brew --prefix)

# check if zsh is already in /etc/shells
if grep -Fxq "$HOMEBREW_PREFIX/bin/zsh" /etc/shells
then
    echo "zsh is already in /etc/shells"
else
    echo "zsh is not in /etc/shells"
    echo $HOMEBREW_PREFIX/bin/zsh | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$HOMEBREW_PREFIX/bin/zsh" ]; then
    chsh -s $HOMEBREW_PREFIX/bin/zsh
fi


if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed"
fi
# grep -qxF 'export ZSH=$HOME/.oh-my-zsh' $HOME/.zshenv || echo 'export ZSH=$HOME/.oh-my-zsh' >> $HOME/.zshenv
source $HOME/.zshenv

# comment out the line that starts with plugins= in ~/.zshrc
sed -i '' 's/^plugins=/# plugins=/g' $HOME/.zshrc

# add plugins to ~/.zshrc with ) being on a newline
echo "plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)" >> $HOME/.zshrc
