"encoding setting (tof)
set encoding=utf-8
scriptencoding utf-8

if &compatible
  set nocompatible
endif
set nobackup
filetype off

"dein.vim setting
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

if has('vim_starting')
  execute 'set runtimepath+=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimshell')
  call dein#add('scrooloose/nerdtree')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('tpope/vim-surround')
  call dein#add('kien/rainbow_parentheses.vim')
" colorschemes...
  call dein#add('tomasr/molokai')
  call dein#add('sickill/vim-monokai')
  call dein#add('jacoborus/tender.vim')
  call dein#add('zakj/vim-mourning')
  call dein#add('lu-ren/SerialExperimentsLain')
  call dein#add('agude/vim-eldar')
  call dein#add('junegunn/seoul256.vim')
  call dein#add('nightsense/vim-crunchbang')
  call dein#add('MaxSt/FlatColor')
  call dein#add('gkjgh/cobalt')
  call dein#add('vim-scripts/newspaper.vim')
  call dein#add('larssmit/vim-getafe')
  call dein#add('itchyny/landscape.vim')

  call dein#end()
endif
if dein#check_install()
  call dein#install()
endif

"default setting (comment added if needed)
"カラースキーマの指定
colorscheme monokai
"colorscheme cobalt
"colorscheme seoul256 
"colorscheme tender
"colorscheme mourning
"colorscheme SerialExperimentsLain
"colorscheme FlatColor
"colorscheme eldar
"colorscheme crunchbang
"colorscheme landscape

"途中経過非描写
set lazyredraw
set t_Co=256
set tags=~/.tags
set noswapfile
set number
set ruler
set cmdheight=1
set laststatus=2
set statusline=[%n]
set statusline+=%<%F\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set notitle 
set nowildmenu
"Tab保管をbashに似ているやつにする.
set wildmode=longest,list
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
set showcmd
set browsedir=buffer
"小文字のみで検索したときに大文字小文字を無視する.
set smartcase
set hlsearch
set background=dark
"検索ワードの最初の文字を入力した時点で検索を開始する.
set incsearch
"保存されていないファイルがあるときでも別のファイルを開けるようにする.
set hidden
"不可視文字を表示する
set list
" タブと行の続きを可視化する
hi SpecialKey ctermfg=darkmagenta
set listchars=extends:<,tab:>-
"対応する括弧やブレースを表示する.
set showmatch
"タブ入力を複数の空白入力に置き換える
set expandtab
"改行時に前の行のインデントを継続する
set autoindent
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
"タブ文字の表示幅
set tabstop=2
"Vimが挿入するインデントの幅
set shiftwidth=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"しかくとかさんかくがくずれないように
set ambiwidth=double
"構文毎に文字色を変化させる
syntax on
"ftplugin設定
filetype plugin indent on
"現在行をハイライト
set cursorline


"ハイライト変更
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=black
highlight CursorLine gui=NONE guifg=NONE guibg=black
highlight LineNr ctermfg=95
highlight Comment ctermfg=59
highlight ModeMsg guifg=darkblue guibg=darkyellow gui=none ctermfg=214 ctermbg=none cterm=none
"ビジュアルベルを有効
set vb
set t_vb=
""""""""""""""""""""""""""""""

" Status line
autocmd VimEnter,Colorscheme * highlight SpecialKey term=bold ctermfg=darkgrey
autocmd VimEnter,Colorscheme * highlight IndentGuidesEven term=bold ctermfg=darkgrey
autocmd VimEnter,Colorscheme * highlight IndentGuidesOdd term=bold ctermfg=darkgrey
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=black ctermbg=yellow cterm=none'
let g:hi_insert2 = 'highlight ModeMsg guifg=darkblue guibg=darkyellow gui=none ctermfg=black ctermbg=yellow cterm=bold'
let g:hi_replace = 'highlight StatusLine guifg=white guibg=red gui=none ctermfg=white ctermbg=161 cterm=none'
let g:hi_replace2 = 'highlight ModeMsg guifg=darkblue guibg=darkyellow gui=none ctermfg=white ctermbg=161 cterm=bold'
let g:hi_visual = 'highlight StatusLine guifg=white guibg=red gui=none ctermfg=16 ctermbg=106 cterm=none'
let g:hi_visual2 = 'highlight ModeMsg guifg=darkblue guibg=darkyellow gui=none ctermfg=16 ctermbg=106 cterm=bold'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine(v:insertmode)
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
"let s:slhlcmd2 = ''
function! s:StatusLine(mode)
	if a:mode == 'i'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		"silent! let s:slhlcmd2 = 'highlight ' . s:GetHighlight('ModeMsg')
		silent exec g:hi_insert
		"silent exec g:hi_insert2
	elseif a:mode == 'r'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		"silent! let s:slhlcmd2 = 'highlight ' . s:GetHighlight('ModeMsg')
		silent exec g:hi_replace
		"silent exec g:hi_replace2
	elseif a:mode == 'v'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		"silent! let s:slhlcmd2 = 'highlight ' . s:GetHighlight('ModeMsg')
		silent exec g:hi_visual
		"silent exec g:hi_visual2
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

autocmd FileType go :highlight goExtraVars cterm=bold ctermfg=136
autocmd FileType go :match goExtraVars /\<ok\>\|\<err\>/
""""""""""""""""""""""""""""""
inoremap <C-j> <esc> 
inoremap <C-f> <C-x><C-o>
noremap <Space>h ^
noremap <Space>l $
nnoremap <esc><esc> :noh<cr> 
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Space>= gg=G''
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap <Space>/ *
nnoremap <Space>n :NERDTreeToggle<Cr>
au BufRead,BufNewFile *.scala  set filetype=scala
"RainbowParentheses Always On
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:python_highlight_all = 1

filetype on
