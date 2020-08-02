call plug#begin('~/.vim/plugged')

Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'

call plug#end()

set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set pastetoggle=<F2>

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

 // scroll the viewport faster
{
    "before": ["<C-e>"],
    "after": ["10", "<C-e>"]
},
{
    "before": ["<C-y>"],
    "after": ["10", "<C-y>"]
},


vmap <C-c> “+yi
vmap <C-x> “+c
vmap <C-v> c<ESC>”+p
imap <C-v> <C-r><C-o>+


