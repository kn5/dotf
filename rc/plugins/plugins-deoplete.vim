let s:default_snippet_path= '~/.config/nvim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/'
let s:my_snippet_path= '~/dotf/rc/snippets/'

let g:deoplete#enable_at_startup = 1
let g:python_highlight_all = 1
let g:neosnippet#snippets_directory = s:default_snippet_path . ',' . s:my_snippet_path
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
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
" for deocomplete
" 補完を選択しpopupを閉じるV
inoremap <expr><C-y> deoplete#close_popup()
" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e> deoplete#cancel_popup()
" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
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
