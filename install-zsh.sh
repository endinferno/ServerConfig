#!/bin/bash

if [ `whoami` = "root" ];then
	prefix=""
else
	prefix="sudo"
fi
$prefix apt update --fix-missing && $prefix apt -y upgrade && $prefix apt autoremove
$prefix apt -y install curl
$prefix apt -y install zsh
# TODO: check if ~/.oh-my-zsh exists
echo "Start Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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
cd ~/.oh-my-zsh/plugins
echo "Start Adding ZSH Plugins"
for plugin in 'colored-man-pages' 'common-aliases' 'docker' 'extract' 'git' 'golang' 'kubectl' 'sudo' 'z' 'fz' 'zsh-autosuggestions' 'zsh-syntax-highlighting' 'zsh-history-substring-search'
do
	res=$(ls -lh | grep " \<$plugin\>$")
	if [ -z "$res" ]; then
		echo "No Such Plugin"
		echo "Install " $plugin
		case $plugin in
			'colored-man-pages')
				;;
			'common-aliases')
				;;
			'docker')
				;;
			'extract')
				;;
			'git')
				;;
			'golang')
				;;
			'kubectl')
				;;
			'sudo')
				;;
			'z')
				;;
			'fz')
				git clone https://github.com/changyuheng/fz.git
				;;
			'zsh-autosuggestions')
				git clone  https://github.com/zsh-users/zsh-autosuggestions.git
				;;
			'zsh-syntax-highlighting')
				git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
				;;
			'zsh-history-substring-search')
				git clone https://github.com/zsh-users/zsh-history-substring-search.git
				;;
			*)
				echo 'No such plugin'
				;;
		esac
	fi
done
