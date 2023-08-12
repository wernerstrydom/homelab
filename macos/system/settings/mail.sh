#!/usr/bin/env zsh
set -Eeuo pipefail
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes