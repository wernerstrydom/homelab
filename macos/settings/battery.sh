#!/usr/bin/env zsh
set -Eeuo pipefail
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"