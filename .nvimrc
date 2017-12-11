"encoding setting (tof)
set encoding=utf-8
scriptencoding utf-8

"Be iMproved
if &compatible | set nocompatible | endif

"Use English Lang
if has("multi_lang") | language C | endif

filetype off

"Read sub-files
runtime! rc/init/*.vim
runtime! rc/dein/*.vim "comment out if using no plugins

syntax on
colorscheme landscape
filetype plugin indent on
