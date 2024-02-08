#! /bin/bash
curl -sS https://webi.sh/k9s | sh
cd Downloads/webi/k9s/0.27.4
tar xzf k9s_Linux_amd64.tar.gz
sudo cp k9s /usr/bin/