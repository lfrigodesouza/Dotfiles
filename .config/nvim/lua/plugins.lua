-- Auto install vim-plug if not installed
vim.cmd [[
    let plug_install = 0
    let autoload_plug_path = stdpath('data') . '/autoload/plug.vim'
    if !filereadable(autoload_plug_path)
        execute '!curl -fL --create-dirs -o ' . autoload_plug_path .
            \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
        execute 'source ' . fnameescape(autoload_plug_path)
        let plug_install = 1
    endif
    unlet autoload_plug_path
]]

-- Plugins list
local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- General
Plug 'nvim-lua/plenary.nvim'
Plug 'ap/vim-css-color'
Plug 'numToStr/Comment.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'goolord/alpha-nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'windwp/nvim-autopairs'
Plug 'romgrk/barbar.nvim'
Plug 'folke/which-key.nvim'
Plug 'akinsho/toggleterm.nvim'

-- Cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

-- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'p00f/nvim-ts-rainbow'

-- Git
Plug 'lewis6991/gitsigns.nvim'

vim.call('plug#end')

-- Auto install plugins on vim-plug installation
vim.cmd [[
    if plug_install
        PlugInstall --sync
    endif
    unlet plug_install
]]

-- Auto install plugins when this file is saved
vim.cmd [[
    augroup vimplug_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PlugUpgrade | PlugClean | PlugUpdate
    augroup end
]]
