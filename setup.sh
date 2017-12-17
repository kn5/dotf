#!/bin/bash

DOT_FILES=(bashrc vimshrc bash_profile screenrc nvimrc tmux.conf latexmkrc)

for file in ${DOT_FILES[@]}
do
  ln -is $HOME/dotf/$file $HOME/.$file
done

mkdir -p $HOME/.config/fish
ln -is $HOME/dotf/config.fish $HOME/.config/fish/config.fish
ln -is $HOME/dotf/config.fish $HOME/config.fish

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.vim
ln -is $HOME/dotf/nvimrc $HOME/.config/nvim/init.vim
if [ ! -d $HOME/.config/nvim/rc ]; then
  ln -s $HOME/dotf/rc $HOME/.config/nvim/rc
fi
if [ ! -d $HOME/.vim/rc ]; then
  ln -s $HOME/dotf/rc $HOME/.vim/rc
fi
ln -is $HOME/dotf/nvimrc $HOME/.vimrc
