#!/bin/bash

VPN_BASE=$HOME
VPN_FOLDER_NAME=clash
VPN_HOME=$VPN_BASE/$VPN_FOLDER_NAME
if [ ! -d "$VPN_HOME" ]
then
    mkdir $VPN_HOME
fi
cp ./clash/clash $VPN_HOME
cp ./clash/start_clash.sh $VPN_HOME
cp ./clash/Country.mmdb $VPN_HOME
scp root@121.5.185.52:~/file/config.yaml $VPN_HOME
chmod +x $VPN_HOME/clash
chmod +x $VPN_HOME/start_clash.sh
echo "alias start-proxy=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\"
alias close-proxy=\"unset https_proxy && unset http_proxy && unset all_proxy\"" >> ~/.bashrc
/bin/bash $VPN_HOME/start-clash.sh
source ~/.bashrc
