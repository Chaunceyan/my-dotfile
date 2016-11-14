#!/bin/bash

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  # Install homebrew
  /usr/bin/ruby -e \
  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install vim
  brew install macvim --override-system-vim

  # Install oh my zsh
  sh -c \
  "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Install vundle
  brew install git
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  # Get vimrc
  ln -svf ./.vimrc ~
  ln -svf ./.zshrc ~

else
  # Linux
  echo "Linux"
fi
