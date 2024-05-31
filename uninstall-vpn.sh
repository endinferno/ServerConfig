#!/bin/bash

CheckDirRemove()
{
    if [ ! -d $1 ];then
        echo "$1 Doesn't exist, pass!"
    else
        echo "$1 exist, remove!"
        rm -rf $1
    fi
}

SOFTWARE_BASE=$HOME/software
VPN_HOME=$SOFTWARE_BASE/clash
CheckDirRemove $VPN_HOME
VPN_CONFIG_HOME=$HOME/.config/clash
CheckDirRemove $VPN_CONFIG_HOME
echo "Remove alias in bashrc"
sed -i '/start-proxy/d' ~/.bashrc
sed -i '/close-proxy/d' ~/.bashrc
