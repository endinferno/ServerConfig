#!/bin/bash

if [ `whoami` = "root" ];then
    prefix=""
else
    prefix="sudo"
fi
echo "Update apt software"
$prefix apt update --fix-missing && $prefix apt -y upgrade && $prefix apt -y autoremove
echo "Install curl"
$prefix apt -y install curl
echo "Install zsh"
$prefix apt -y install zsh
# TODO: check if ~/.oh-my-zsh exists
echo "Start Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/endinferno/ohmyzsh/master/tools/install.sh)"
cp ./zshrc-config ~/.zshrc
if [ "$(uname)" == "Darwin" ]
then
    # MacOS
    brew install trash
    echo "alias rm=\"trash\"" >> ~/.zshrc
elif [ "$(uname)" == "Linux" ]
then
    # GNU/Linux
    $prefix apt install trash-cli
    echo "alias rm=\"trash-put\"" >> ~/.zshrc
else
    echo "Not Support"
    # Not Support
fi
