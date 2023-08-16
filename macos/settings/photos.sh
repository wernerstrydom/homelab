#!/usr/bin/env zsh
set -Eeuo pipefail

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true