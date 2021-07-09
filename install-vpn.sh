#!/bin/bash

mkdir ~/clash && cd ~/clash
mv ./clash/clash ~/clash
mv ./clash/start_clash.sh ~/clash
scp root@121.5.185.52:~/file/config.yaml ~/clash
chmod +x ~/clash/clash
chmod +x ~/clash/start_clash.sh
echo "alias start-proxy=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\"
alias close-proxy=\"unset https_proxy && unset http_proxy && unset all_proxy\"" >> ~/.bashrc
/bin/bash ~/clash/start_clash.sh
source ~/.bashrc
