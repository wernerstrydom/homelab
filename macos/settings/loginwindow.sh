#!/usr/bin/env zsh
set -Eeuo pipefail
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false
defaults write com.apple.loginwindow RestartDisabled -bool true
defaults write com.apple.loginwindow ShutDownDisabled -bool false
defaults write com.apple.loginwindow TALLogoutSavesState -bool false