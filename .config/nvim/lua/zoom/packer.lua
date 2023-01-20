-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --colors
    use 'gruvbox-community/gruvbox'
    use 'folke/tokyonight.nvim'

    use 'sainnhe/gruvbox-material'
    -- use 'flazz/vim-colorschemes'

    use 'norcalli/nvim-colorizer.lua'
    use 'kyazdani42/nvim-web-devicons'

    --  Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    --  Telescope extensions
    -- use 'camgraff/telescope-tmux.nvim'
    use 'edolphin-ydf/goimpl.nvim'
    -- use 'dhruvmanila/telescope-bookmarks.nvim'

    -- neovim lsp server
    use 'neovim/nvim-lspconfig'

    -- lsp companion
    -- Plug 'hrsh7th/nvim-compe'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --  Plug 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'saadparwaiz1/cmp_luasnip'

    -- Luasnip
    use 'L3MON4D3/LuaSnip'

    -- neovim treesitter
    use ({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'

    -- ranger integration
    -- Plug 'francoiscabrol/ranger.vim'
    use 'rbgrouleff/bclose.vim'

    -- lf filemanger
    use 'ptzz/lf.vim'

    -- golang
    use ({'fatih/vim-go', run = ':GoUpdateBinaries'})
    use 'buoto/gotests-vim'

    -- comment
    use 'terrortylor/nvim-comment'
    --  Plug 'numToStr/Comment.nvim'
    -- Plug 'manasthakur/vim-commentor'


    -- galaxyline
    use ({
        'glepnir/galaxyline.nvim' , 
        branch = 'main',
        -- your statusline
        config = function()
            require('zoom.galaxyline')
        end,
        -- some optional icons
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })

    -- vim-fugitive
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'

    -- git gutter
    use 'airblade/vim-gitgutter'

    use 'tpope/vim-surround'

    use 'unblevable/quick-scope'

    --  Formattor
    use 'sbdchd/neoformat'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- symbols-outlines
    use 'simrat39/symbols-outline.nvim'

    -- terminal
    use 'voldikss/vim-floaterm'
    use 'norcalli/nvim-terminal.lua'

    -- markdown-preview
    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- latex
    use ({'xuhdev/vim-latex-live-preview', ft = { 'tex' }})
    use 'lervag/vimtex'

    -- vim-gist
    use 'mattn/vim-gist'
    use 'mattn/webapi-vim'

    -- use 'preservim/nerdtree'
    -- use 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    -- use 'kyazdani42/nvim-web-devicons' -- for file icons
    -- use 'kyazdani42/nvim-tree.lua'

    use 'nvim-orgmode/orgmode'

end)
