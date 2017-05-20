#!/bin/bash

function program_is_installed {
	# set to 1 initially
	local return_=1
	# set to 0 if not found
	type $1 >/dev/null 2>&1 || { local return_=0; }
	# return value
	echo "$return_"
}

if [[ `uname` == 'Darwin' ]]; then
	# MacOS
	# Install homebrew
	if ! hash brew 2>/dev/null; then
		/usr/bin/ruby -e \
		"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "Brew is installed!"
	fi

	# Install vim
	if ! hash macvim 2>/dev/null; then
		brew install macvim --with-override-system-vim
	else
		echo "MacVim is intalled!"
	fi

	# Install oh my zsh
	if ! hash zsh 2>/dev/null;  then
		sh -c \
		"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		brew install zsh-syntax-highlighting
	else
		echo "ZSH is intalled!"
	fi
	# Install vundle

	if ! hash git 2>/dev/null; then
		brew install git
	fi
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


	# Get vimrc
	ln -vf ./.vimrc ~/.vimrc
	ln -vf ./.zshrc ~/.zshrc

	# Install powerline fonts
	git clone https://github.com/powerline/fonts
	sh ./fonts/install.sh
	rm -rf fonts

	# Install YcmCompleter
	brew install cmake
	cd ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

else
	# Linux starts here.
	# Install vim
	if ! which macvim 2>/dev/null; then
		apt install -y vim
	else
		echo "Vim is intalled!"
	fi
	# Get vimrc
	ln -vf ./.vimrc ~/.vimrc
	ln -vf ./.zshrc ~/.zshrc


	if ! which git 2>/dev/null; then
		apt install -y git
	else
		echo "Git is installed!"
	fi

	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	# Install oh my zsh
	if ! which zsh 2>/dev/null;  then
		apt install -y zsh
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

		sh -c \
		"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

		git clone https://github.com/zsh-users/zsh-syntaxhihighlighting.git \
		${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

		git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

	else
		echo "ZSH is intalled!"
	fi

	# Install Vundle
	if ls ~/.vim/bundle/Vundle.vim; then

		read -p "Now go to vim to install plugins then Press [Enter] ..."

		# Install Powerline
		git clone https://github.com/powerline/fonts
		sh ./fonts/install.sh
		rm -rf fonts

		# Install YCM
		apt-get install -y build-essential cmake
		apt-get install -y python-dev python3-dev
		cd ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

	fi
fi
