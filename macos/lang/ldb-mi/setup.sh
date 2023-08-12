#!/usr/bin/env ksh
set -Eeuo pipefail

# check if /usr/local/bin/ldb-mi exists, if it does not, then install it
if [[ -f /usr/local/bin/ldb-mi ]]; then
  echo "ldb-mi is already installed"
  exit 0
fi

if [[ $(uname -m) == "arm64" ]]; then
  echo "Downloading ARM64 version of ldb-mi"
  URL="https://go.microsoft.com/fwlink/?linkid=2189794"
  BINARY_PATH="/tmp/ldb-mi/debugAdapters/lldb-mi_arm64/bin/lldb-mi"
else
  echo "Downloading Intel version of ldb-mi"
  URL="https://go.microsoft.com/fwlink/?linkid=2189795"
  BINARY_PATH="/tmp/ldb-mi/debugAdapters/lldb-mi_x86_64/bin/lldb-mi"

fi

curl -L -o /tmp/ldb-mi.zip $URL
unzip /tmp/ldb-mi.zip -d /tmp/ldb-mi
sudo cp $BINARY_PATH /usr/local/bin/ldb-mi
chmod +x /usr/local/bin/ldb-mi
rm -Rf /tmp/ldb-mi.zip /tmp/ldb-mi


