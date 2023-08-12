#!/usr/bin/env ksh
set -Eeuo pipefail

if [[ $(uname -m) == "arm64" ]]; then
  echo "Downloading ARM64 version of ldb-mi"
  URL="https://go.microsoft.com/fwlink/?linkid=2189794"
else
  echo "Downloading Intel version of ldb-mi"
  URL="https://go.microsoft.com/fwlink/?linkid=2189795"
fi

curl -L -o /tmp/ldb-mi.zip $URL
unzip /tmp/ldb-mi.zip -d /tmp/ldb-mi
sudo cp /tmp/ldb-mi/debugAdapters/lldb-mi/bin/lldb-mi /usr/local/bin/ldb-mi
chmod +x /usr/local/bin/ldb-mi
