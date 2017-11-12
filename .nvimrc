"encoding setting (tof)
set encoding=utf-8
scriptencoding utf-8

if &compatible
  set nocompatible " Be iMproved
endif

" No use Japanese language message
if has("multi_lang")
  language C
endif

filetype off

runtime! rc/init/*.vim
runtime! rc/dein/*.vim "comment out if using no plugins

syntax on
colorscheme landscape
filetype plugin indent on
