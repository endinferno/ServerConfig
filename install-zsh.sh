#!/bin/bash

sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zshrc-config ~/.zshrc
if["$(uname)"=="Darwin"];then
	# MacOS
	brew install trash
	echo "alias rm=\"trash\"" >> ~/.zshrc
elif["$(expr substr $(uname -s) 1 5)"=="Linux"];then
	# GNU/Linux
	sudo apt install trash-cli
	echo "alias rm=\"trash-put\"" >> ~/.zshrc
elif["$(expr substr $(uname -s) 1 10)"=="MINGW32_NT"];then
	# Windows
fi
cd ~/.oh-my-zsh/plugins
for plugin in 'colored-man-pages' 'common-aliases' 'docker' 'extract' 'fzf' 'git' 'golang' 'kubectl' 'sudo' 'z' 'fz' 'zsh-autosuggestions' 'zsh-syntax-highlighting' 'zsh-history-substring-search'
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
			'fzf')
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

