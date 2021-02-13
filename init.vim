set exrc

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'

"ranger integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"golang
Plug 'tweekmonster/gofmt.vim'
Plug 'fatih/vim-go'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'manasthakur/vim-commentor'

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntax highlighter
Plug 'sheerun/vim-polyglot'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

"vim-fugitive
Plug 'tpope/vim-fugitive'

Plug 'stsewd/fzf-checkout.vim'

call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal guibg=none

let mapleader = " "

let g:ranger_replace_netrw = 1
nnoremap <leader>rgr :Ranger<CR>
nnoremap <leader>rgw :RangerWorkingDirectory<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" FZF related
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :GFiles<CR>

"git related
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>gc :GCheckout<CR>
