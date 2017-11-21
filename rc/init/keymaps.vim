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
noremap ; :
noremap : ;

inoremap { {}<LEFT>
inoremap ( ()<ESC>i
inoremap [ []<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
let mapleader = ","
