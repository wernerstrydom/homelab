#!/usr/bin/env zsh
set -Eeuo pipefail
mkdir -p $HOME/Pictures/Screenshots
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location $HOME/Pictures/Screenshots
defaults write com.apple.screencapture type jpg