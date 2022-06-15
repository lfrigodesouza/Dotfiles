local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug('junegunn/fzf', {
    ['do'] = function()
        vim.call('fzf#install')
    end
})
Plug 'yggdroot/indentline'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'

vim.call('plug#end')
