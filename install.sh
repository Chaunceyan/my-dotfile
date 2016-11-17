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
  ln -f ./.vimrc ~/.vimrc
  ln -f ./.zshrc ~/.zshrc

  # Install powerline fonts
  git clone https://github.com/powerline/fonts
  sh ./fonts/install.sh
  rm -rf fonts
  
  # Install YcmCompleter
  brew install cmake
  cd ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

else
  # Linux
  echo "Linux"
fi
