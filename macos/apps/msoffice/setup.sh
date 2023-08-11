#!/usr/bin/env ksh
set -Eeuo pipefail

PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$PATH/Brewfile