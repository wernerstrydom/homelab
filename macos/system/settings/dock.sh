#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"


defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock itunes-notifications -bool true

defaults write com.apple.dock magnification -int 0
defaults write com.apple.dock mcx-expose-disabled -boolean true
defaults write com.apple.dock no-glass -bool true
defaults write com.apple.dock show-process-indicators -bool true

defaults write com.apple.dock size-immutable -boolean true
defaults write com.apple.dock wvous-show-windows-in-other-spaces -bool FALSE

defaults write com.apple.dock tilesize -float 64
defaults write com.apple.dock largesize -float 92

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Do not only show open applications in the Dock
defaults write com.apple.dock static-only -bool false

# Don't show recent applications in the dock
defaults write com.apple.dock show-recents -bool false

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -int 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -int 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

killall "Dock" &> /dev/null