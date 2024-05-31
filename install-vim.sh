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

if [ `whoami` = "root" ];then
    prefix=""
else
    prefix="sudo"
fi
echo "Remove vim"
$prefix apt remove -y vim vim-runtime vim-tiny vim-common vim-doc vim-scripts
vim_soft_name=$(dpkg -l | grep vim | awk '{print $2}')
$prefix dpkg -P $vim_soft_name

echo "Install vim dependency"
$prefix apt install -y python3-dev libncurses5-dev

SOFTWARE_BASE=$HOME/software
CheckDirExist $SOFTWARE_BASE

echo "Clone vim repo"
pushd ${SOFTWARE_BASE}
git clone https://github.com/vim/vim.git
popd
VIM_HOME=$SOFTWARE_BASE/vim
VIM_INSTALL=$VIM_HOME/install
mkdir -p $VIM_INSTALL

echo "Compile and install vim"
pushd ${VIM_HOME}
./configure --prefix=$VIM_INSTALL \
    --enable-fontset \
    --enable-terminal \
    --enable-multibyte \
    --enable-python3interp=yes \
    --with-python3-command=python3
make -j`nproc`
make install
popd
