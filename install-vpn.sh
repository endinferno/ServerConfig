#!/bin/bash

CheckDirExist()
{
    if [ ! -d $1 ];then
        echo "$1 Doesn't exist, create!"
        mkdir -p $1
    else
        echo "$1 exist, pass!"
    fi
}

CopyVPNFile()
{
    echo "Copy VPN files to $1"
    cp ./clash/clash $1
    cp ./clash/start-clash $1
    cp ./clash/stop-clash $1
    cp ./clash/Country.mmdb $1
    cp ./clash/Country.mmdb $2
    chmod +x $1/clash
    chmod +x $1/start-clash
}

SOFTWARE_BASE=$HOME/software
CheckDirExist $SOFTWARE_BASE
VPN_HOME=$SOFTWARE_BASE/clash
CheckDirExist $VPN_HOME
VPN_CONFIG_HOME=$HOME/.config/clash
CheckDirExist $VPN_CONFIG_HOME
CopyVPNFile $VPN_HOME $VPN_CONFIG_HOME
echo "Add alias to bashrc"
echo "alias start-proxy=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\"
alias close-proxy=\"unset https_proxy && unset http_proxy && unset all_proxy\"" >> ~/.bashrc
source ~/.bashrc
