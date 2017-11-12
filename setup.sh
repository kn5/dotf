#!/bin/bash

DOT_FILES=(.bashrc .vimshrc .bash_profile .screenrc .nvimrc config.fish .tmux.conf)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotf/$file $HOME/$file
done

ln -s $HOME/dotf/.nvimrc $HOME/.config/nvim/init.vim
ln -s $HOME/dotf/rc $HOME/.config/nvim/rc
ln -s $HOME/dotf/rc $HOME/.vim/rc

ln -s $HOME/dotf/.nvimrc $HOME/.vimrc
