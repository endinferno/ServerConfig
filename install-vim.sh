#!/bin/bash

if [ $# != 1 ] ; then
	echo "Not Input Python3 Config Folder Path, exit!"
	exit 1
fi
# Remove vim first
sudo apt remove -y vim vim-runtime vim-tiny vim-common vim-doc vim-scripts
vim_soft_name=$(dpkg -l | grep vim | awk '{print $2}')
sudo dpkg -P $vim_soft_name

CPU_NUM=$(cat /proc/cpuinfo | grep "MHz" | wc -l)
sudo apt install python3-dev ruby-dev lua5.1 lua5.1-dev
git clone https://github.com/vim/vim.git
cd vim
./configure --enable-fontset --enable-cscope --enable-terminal --enable-multibyte --enable-python3interp=yes --with-python3-config-dir=$1 --enable-luainterp=yes --enable-rubyinterp=yes --enable-perlinterp=yes
make -j $CPU_NUM
sudo make install
