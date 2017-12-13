set encoding=utf-8
scriptencoding utf-8
if &compatible | set nocompatible | endif

"let s:is_win = has('win16') || has('win32') || has('win64')
"let s:is_cygwin = has('win32unix')
"let s:is_mac = !s:is_win && !s:is_cygwin
"  \ && (has('mac') || has('macunix') || has('gui_macvim') ||
"  \ (!executable('xdg-open') &&
"  \ system('uname') =~? '^darwin'))

language message C

filetype off

runtime! rc/init/*.vim
runtime! rc/dein/*.vim "Comment out if using plain .nvimrc

syntax on
"colorscheme landscape
filetype plugin indent on
