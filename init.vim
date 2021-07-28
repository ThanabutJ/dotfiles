let g:polyglot_disabled = []

set exrc

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'gruvbox-community/gruvbox'

"neovim lsp server
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'steelsojka/completion-buffers'

Plug 'hrsh7th/nvim-compe'

Plug 'glepnir/lspsaga.nvim'

"Luasnip
Plug 'L3MON4D3/LuaSnip'

"neovim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/playground'

"ranger integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"golang
"Plug 'tweekmonster/gofmt.vim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'manasthakur/vim-commentor'

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntax highlighter
"Plug 'sheerun/vim-polyglot'

"fzf
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
"Plug 'junegunn/fzf.vim'
"Plug 'stsewd/fzf-checkout.vim'

"vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'tpope/vim-surround'

Plug 'unblevable/quick-scope'

Plug 'easymotion/vim-easymotion'

Plug 'sbdchd/neoformat'

Plug 'wsdjeg/vim-todo'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'etdev/vim-hexcolor'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"symbols-outlines
Plug 'simrat39/symbols-outline.nvim'

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'voldikss/vim-floaterm'

call plug#end()

"colorscheme gruvbox
"set background=dark
highlight Normal guibg=none

let mapleader = " "

let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>rgr :Ranger<CR>
nnoremap <leader>rgw :RangerWorkingDirectory<CR>


"git related
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>gb :G blame<CR>

"polyglot related
"let g:polyglot_disabled = ['autoindent']

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Vim Quickscope
" Trigger a highlight in the appropriate direction when pressing thes keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

nnoremap gpt :Prettier<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprevious<CR>

nnoremap tt :tab split<CR>
nnoremap <C-w>< <C-w>10<
nnoremap <C-w>> <C-w>10>
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

nnoremap <C-b> <cmd>CHADopen<cr>

let g:floaterm_wintype='split'
let g:floaterm_height=0.4
nnoremap <F9> :FloatermToggle --wintype=split --<cr>
nnoremap <F8> :FloatermToggle --wintype=float --height=0.8 --width=0.7<cr>
tnoremap <F9> <C-\><C-n>:FloatermToggle<cr>

nnoremap <leader><TAB> <C-^>

let g:netrw_browsex_viewer= "brave"
