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
Plug 'ap/vim-css-color'
Plug 'numToStr/Comment.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'L3MON4D3/LuaSnip'
Plug 'mhinz/vim-startify'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'vim-airline/vim-airline'
Plug 'williamboman/nvim-lsp-installer'
Plug 'yggdroot/indentline'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'folke/which-key.nvim'
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
