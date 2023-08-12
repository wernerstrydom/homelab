#!/usr/bin/env ksh
set -Eeuo pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle --file=$SCRIPT_DIR/Brewfile

## download and install ldb-mi. If we're running on a M1 Mac, download https://go.microsoft.com/fwlink/?linkid=2189794, and if it's an intel Mac download https://go.microsoft.com/fwlink/?linkid=2189795
## unzip the file and run the installer
#if [[ $(uname -m) == "arm64" ]]; then
#  curl -o /tmp/ldb-mi.zip https://go.microsoft.com/fwlink/?linkid=2189794
#else
#  curl -o /tmp/ldb-mi.zip https://go.microsoft.com/fwlink/?linkid=2189795
#fi
#unzip /tmp/ldb-mi.zip -d /tmp/ldb-mi
#sudo cp /tmp/ldb-mi/debugAdapters/lldb-mi/bin/lldb-mi /usr/local/bin/ldb-mi
#chmod +x /usr/local/bin/ldb-mi
