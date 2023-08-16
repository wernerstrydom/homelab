#!/usr/bin/env zsh
set -Eeuo pipefail
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -int 0
defaults write com.apple.finder ShowMountedServersOnDesktop -int 0
defaults write com.apple.finder NewWindowTarget 'PfHm'
defaults write com.apple.finder NewWindowTargetPath "'file://$HOME'"
defaults write com.apple.finder WarnOnEmptyTrash -int 0
defaults write com.apple.finder ShowPathbar -int 1
defaults write com.apple.finder ShowStatusBar -int 1
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes:
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"