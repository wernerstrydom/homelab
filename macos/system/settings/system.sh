#!/usr/bin/env zsh
set -Eeuo pipefail

# Turns on lid wakeup
sudo pmset -a lidwake 1

# Automatic restart on power loss
sudo pmset -a autorestart 1

# Restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on