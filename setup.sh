#!/bin/bash

DOT_FILES=(.bashrc .vimrc .vimshrc .bash_profile .screenrc .nvimrc config.fish .tmux.conf)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotf/$file $HOME/$file
done

ln -s $HOME/dotf/.nvimrc $HOME/.config/nvim/init.vim
mv $HOME/dotf/rc $HOME/.config/nvim/
