#!/usr/bin/env ksh
set -Eeuo pipefail

# get the path of this script, but don't change to it
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"


brew bundle --file=$SCRIPTPATH/Brewfile