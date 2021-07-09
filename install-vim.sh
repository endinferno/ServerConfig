#!/bin/bash

if [ `whoami` = "root" ];then
	prefix=""
else
	prefix="sudo"
fi
$prefix apt install python3-dev
if [ $# != 1 ] ; then
	echo "Not Input Python3 Config Folder Path, exit!"
	exit 1
fi
# Remove vim first
$prefix apt remove -y vim vim-runtime vim-tiny vim-common vim-doc vim-scripts
vim_soft_name=$(dpkg -l | grep vim | awk '{print $2}')
$prefix dpkg -P $vim_soft_name

CPU_NUM=$(cat /proc/cpuinfo | grep "MHz" | wc -l)
$prefix apt install python3-dev ruby-dev lua5.1 libncurses-dev
git clone https://github.com/vim/vim.git
cd vim
./configure --enable-fontset --enable-cscope --enable-terminal --enable-multibyte --enable-python3interp=yes --with-python3-config-dir=$1 --enable-luainterp=yes --enable-rubyinterp=yes --enable-perlinterp=yes
make -j $CPU_NUM
$prefix make install
