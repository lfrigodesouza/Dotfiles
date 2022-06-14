"    __    ___________   _   ______________
"   / /   / ____/ ___/  / | / / ____/_  __/
"  / /   / /_   \__ \  /  |/ / __/   / /
" / /___/ __/  ___/ / / /|  / /___  / /
"/_____/_/    /____(_)_/ |_/_____/ /_/
" https://LFrigoDeSouza.NET
" https://github.com/lfrigodesouza/Dotfiles
" 
" Configuration file for NeoVim

""" PLUGINS
" Auto install vim-plug if not installed
let plug_install = 0
let autoload_plug_path = stdpath('data') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    execute '!curl -fL --create-dirs -o ' . autoload_plug_path .
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

" vim-plug plugin manager
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
call plug#end()

" auto install vim-plug plugins on install:
if plug_install
    PlugInstall --sync
endif
unlet plug_install

""" SETTINGS
" Basic
set number
set ruler
set hlsearch
set ignorecase
set incsearch
set autoindent
set smartcase
set relativenumber
set cursorline
set cursorcolumn
set nocompatible
syntax on

" Custom
set timeoutlen=200 " Timeout between two keystrokes
set clipboard=unnamedplus " Make possible to paste from clipboard
set tabstop=4 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set laststatus=2
set encoding=utf-8
set spell spelllang=pt_br,en_us

" easymotion
:let g:EasyMotion_smartcase = 1

" Show empty characters
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set list

" Vim Airline
:let g:airline_powerline_fonts = 1
:let g:airline_theme='dracula_pro'

"Dracula PRO theme
packadd! dracula_pro
let g:dracula_colorterm = 0
colorscheme dracula_pro

""" Key mappings
" Adds ; to the end of the line
map <Space>; m`A;<Esc>``

" Adds a line above or under current line
map oo m`o<Esc>``
map OO m`O<Esc>``

" Opens .vimrc to edition
map <silent> zl :e ~\.config/nvim/init.vim<CR>
" Reloads the .vimrc configuration
map <silent> zr :source ~\.config/nvim/init.vim<CR>

" Toggles NERDTree
map <silent> <F2> :NERDTreeToggle<CR>

" Fast q macro executor
map Q @q

" Duplicates current line
map <Space>d yyp

" Removes hightlight of the last search
map <silent> <Space>/ :noh<CR>
