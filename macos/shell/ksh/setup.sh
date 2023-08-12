#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

HOMEBREW_PREFIX=$(brew --prefix)
if [ "$SHELL" != "$HOMEBREW_PREFIX/bin/ksh" ]; then
    grep -qxF "$HOMEBREW_PREFIX/bin/ksh" /etc/shells || echo "$HOMEBREW_PREFIX/bin/ksh" | sudo tee -a /etc/shells
    chsh -s $HOMEBREW_PREFIX/bin/ksh
fi


if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed"
fi

grep -qxF "source \$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" || echo "source \$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

sed -i '' '/^plugins=(.*/ s//plugins=\(git python 1password vscode github golang aws ansible zsh-autosuggestions\)/' "$HOME/.zshrc"

echo "# ---------------------------------------------------------------------------------------------------------------" >> $HOME/.zshrc
echo "# Aliases" >> $HOME/.zshrc
echo "# ---------------------------------------------------------------------------------------------------------------" >> $HOME/.zshrc
cat $SCRIPT_DIR/../../alias >> $HOME/.zshrc