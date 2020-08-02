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
