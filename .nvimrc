set encoding=utf-8
scriptencoding utf-8

if &compatible | set nocompatible | endif
if has("multi_lang") | language C | endif

filetype off

runtime! rc/init/*.vim
runtime! rc/dein/*.vim "Comment out if using plain .nvimrc

syntax on
"colorscheme landscape
filetype plugin indent on
