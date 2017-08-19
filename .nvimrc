"encoding setting (tof)
set encoding=utf-8
scriptencoding utf-8

if &compatible
  set nocompatible
endif
set nobackup
filetype off

" 関数定義
"Deoplete:
function! DeopleteConfig()
  call deoplete#custom#set('_', 'converters', ['converter_auto_paren', 'converter_remove_overlap'])
  call deoplete#custom#set('_', 'min_pattern_length', 1)
  call deoplete#custom#set('buffer', 'rank', 100)
  call deoplete#custom#set('go', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#set('go', 'sorters', [])
  call deoplete#custom#set('jedi', 'disabled_syntaxes', ['Comment'])
  call deoplete#custom#set('jedi', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#set('neosnippet', 'disabled_syntaxes', ['goComment'])"
  call deoplete#custom#set('ternjs', 'rank', 0)
  call deoplete#custom#set('vim', 'disabled_syntaxes', ['Comment'])
endfunction

" ******************
" dein.vim 関連 
" ******************
let s:dein_dir = expand('~/.config/nvim/dein')
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

"  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/unite.vim') "for VimShell History
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim', {'hook_source': "call DeopleteConfig()"})
  call dein#add('zchee/deoplete-jedi')
"  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet', {'autload': {'insert': 1,}})
  call dein#add('Shougo/neosnippet-snippets', {'autload': {'insert': 1,}})
  call dein#add('Shougo/vimshell')
  call dein#add('scrooloose/nerdtree')
  call dein#add('davidhalter/jedi-vim', {'on_ft' : 'python'})
  call dein#add('tpope/vim-surround')
  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
" call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('scrooloose/syntastic')
  call dein#add('lervag/vimtex')

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
  call dein#add('sonjapeterson/1989.vim')
  call dein#add('zeis/vim-kolor')
  call dein#add('dracula/vim')
  call dein#add('marciomazza/vim-brogrammer-theme')

" for evernote
  call dein#add('kakkyz81/evervim')

  call dein#end()
endif

if dein#check_install()
  call dein#install()
endif

function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
command! DeinClean :call s:deinClean()

"default setting (comment added if needed)
"カラースキーマの指定
"数字の色がみにくいので変更
autocmd ColorScheme * highlight Number ctermfg=199

"colorscheme monokai
"colorscheme 1989
"colorscheme cobalt
"colorscheme seoul256 
"colorscheme tender
"colorscheme mourning
"colorscheme SerialExperimentsLain
"colorscheme FlatColor
"colorscheme eldar
"colorscheme crunchbang
"colorscheme landscape

" ******************
" 設定あれこれ
" ******************
set lazyredraw
set t_Co=256
set tags=~/.tags
set noswapfile
set number
set ruler
set cmdheight=1
set laststatus=2
"set showtabline=2
set statusline=[%n]
set statusline+=%<%F\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set notitle 
"set noshowmode 
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
set listchars=extends:<,tab:>+
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
""""""""""""""""""""""""""""""
" Unite.vimの設定
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
let g:rbpt_colorpairs = [
      \ ['blue',       '#FF6000'],
      \ ['cyan', '#00FFFF'],
      \ ['darkmagenta',    '#CC00FF'],
      \ ['yellow',   '#FFFF00'],
      \ ['red',     '#FF0000'],
      \ ['darkgreen',    '#00FF00'],
      \ ['White',         '#c0c0c0'],
      \ ['blue',       '#FF6000'],
      \ ['cyan', '#00FFFF'],
      \ ['darkmagenta',    '#CC00FF'],
      \ ['yellow',   '#FFFF00'],
      \ ['red',     '#FF0000'],
      \ ['darkgreen',    '#00FF00'],
      \ ['White',         '#c0c0c0'],
      \ ['blue',       '#FF6000'],
      \ ['cyan', '#00FFFF'],
      \ ['darkmagenta',    '#CC00FF'],
      \ ['yellow',   '#FFFF00'],
      \ ['red',     '#FF0000'],
      \ ['darkgreen',    '#00FF00'],
      \ ['White',         '#c0c0c0'],
      \ ]
let g:rbpt_max = 21

let g:deoplete#enable_at_startup = 1
let g:python_highlight_all = 1
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets/'
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" for deocomplete
" 補完を選択しpopupを閉じるV
inoremap <expr><C-y> deoplete#close_popup()
" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e> deoplete#cancel_popup()
" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g> deoplete#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-l> deoplete#complete_common_string()
" C-kを押すと行末まで削除
inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"
nnoremap <silent> 'v :VimShell<CR>
nnoremap <silent> 's :VimShellPop<CR>
map <C-n> :NERDTreeToggle<CR>
" 括弧補完しましょう
inoremap { {}<LEFT>
inoremap ( ()<ESC>i
inoremap [ []<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
" <Leader> を,に変更
let mapleader = ","
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=245
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:airline_themes = 'qwq'
let g:airline_powerline_fonts = 1
let g:evervim_devtoken="S=s494:U=a39e2b5:E=16423742fa3:C=15ccbc30270:P=1cd:A=en-devtoken:V=2:H=b488bc791e671282ff01b2a7958417cf"
" For EverVim
nnoremap <Space>l :EvervimNotebookList<CR>
nnoremap <Space>s :EvervimNoteByQuery<Space>
nnoremap <Space>c :EvervimCreateNote<CR>
nnoremap <Space>t :EvervimListTags<CR>

" automatically insert shebang
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

autocmd BufWritePost * :call AddExecmod()
function AddExecmod()
    let line = getline(1)
    if strpart(line, 0, 2) == "#!"
        call system("chmod +x ". expand("%"))
    endif
endfunction

colorscheme brogrammer
filetype on
