#!/bin/bash

if [ `whoami` = "root" ];then
    prefix=""
else
    prefix="sudo"
fi
echo "Remove oh my zsh"
uninstall_oh_my_zsh
echo "Remove zsh"
$prefix apt remove -y zsh
$prefix apt update --fix-missing && $prefix apt -y upgrade && $prefix apt autoremove
echo "Remove zsh related files"
rm -rf ~/.zsh*
rm -rf ~/.zcompdump*
