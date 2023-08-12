#!/usr/bin/env zsh
set -Eeuo pipefail
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool false
defaults write com.apple.NetworkBrowser DisableAirDrop -bool true