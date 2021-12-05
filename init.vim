set exrc

call plug#begin('~/.vim/plugged')

"colors
Plug 'gruvbox-community/gruvbox'

Plug 'sainnhe/gruvbox-material'
"Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
"Plug 'chriskempson/base16-vim'
"Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'camgraff/telescope-tmux.nvim'

"neovim lsp server
Plug 'neovim/nvim-lspconfig'

"lsp companion
"Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'saadparwaiz1/cmp_luasnip'

"Luasnip
Plug 'L3MON4D3/LuaSnip'

"neovim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/playground'

"ranger integration
"Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"lf filemanger
Plug 'ptzz/lf.vim'

"golang
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'buoto/gotests-vim'

"comment
" Plug 'terrortylor/nvim-comment'
Plug 'numToStr/Comment.nvim'
"Plug 'manasthakur/vim-commentor'

"galaxyline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

"fzf
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
"Plug 'junegunn/fzf.vim'
"Plug 'stsewd/fzf-checkout.vim'

"vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

"git gutter
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'

Plug 'unblevable/quick-scope'

Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"symbols-outlines
Plug 'simrat39/symbols-outline.nvim'

"terminal
Plug 'voldikss/vim-floaterm'
Plug 'norcalli/nvim-terminal.lua'

"markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'

"vim-gist
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'

Plug 'preservim/nerdtree'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

call plug#end()

"colorscheme gruvbox
"set background=dark
highlight Normal guibg=none

let mapleader = " "

"Gitgutter remove default mapping
let g:gitgutter_map_keys = 0

"git related
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>gb :G blame<CR>

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

nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-k> :cprevious<CR>zzzv
nnoremap <leader>j :lnext<CR>zzzv
nnoremap <leader>k :lprevious<CR>zzzv

nnoremap tt :tab split<CR>
nnoremap <C-w>< <C-w>10<
nnoremap <C-w>> <C-w>10>
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" exit terminal mode to n mode
tnoremap <C-q> <C-\><C-n>

nnoremap <leader><TAB> <C-^>


"prime top 5 remap
" Number 5: Behave vim
nnoremap Y y$

" Number 4: Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Number 3: Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Number 2: Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Number 1: Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
"nnoremap <M-j> :m .+1<CR>==
"nnoremap <M-k> :m .-3<CR>==


nnoremap <leader><leader>/ :filetype detect<cr>
nmap <leader><leader>' :set filetype=
nmap <leader>m :Man 

nmap <silent> <leader>tsh :TSBufToggle highlight<cr>

nnoremap <C-B> :CHADopen<cr>

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browsex_viewer= "brave"
let g:netrw_winsize = 25
let g:netrw_altv = 1

nnoremap <leader>v :vsp<cr>

nnoremap <leader><leader>f :Neoformat<CR>
