#!/usr/bin/env zsh
set -Eeuo pipefail
defaults write com.microsoft.Outlook HideCanAddOtherAccountTypesTipText -bool false
defaults write com.microsoft.office ShowWhatsNewOnLaunch -bool false
defaults write com.microsoft.office DefaultsToLocalOpenSave -bool true
defaults write com.microsoft.Outlook Weather_update_automatically -bool true
defaults write com.microsoft.Outlook DefaultWeatherLocation -string "Hayward, CA"