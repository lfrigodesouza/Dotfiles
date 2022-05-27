"    __    ___________   _   ______________
"   / /   / ____/ ___/  / | / / ____/_  __/
"  / /   / /_   \__ \  /  |/ / __/   / /
" / /___/ __/  ___/ / / /|  / /___  / /
"/_____/_/    /____(_)_/ |_/_____/ /_/
" https://LFrigoDeSouza.NET
" https://github.com/lfrigodesouza/Dotfiles
" 
" Configuration file for Vim

""" PLUGINS
" vim-plug plugin manager
call plug#begin('~/vimfiles/plugged')
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
call plug#end()

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
set nowrap
set nocompatible
syntax on

" Custom
set timeoutlen=200 " Timeout between two keystrokes
set clipboard=unnamed " Make possible to paste from clipboard
set tabstop=4 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set laststatus=2
set encoding=utf-8

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

" Removes the GUI interface from gVIM
if has('gui_running')
    set guifont="Fira Code NerdFont":h10:cANSI:qDRAFT
    set lines=40 columns=175
    set guioptions -=m 
    set guioptions -=T
endif

""" Key mappings
" Adds ; to the end of the line
map <Space>; m`A;<Esc>``

" Adds a line above or under current line
map oo m`o<Esc>``
map OO m`O<Esc>``

" Opens .vimrc to edition
map <silent> zl :e ~\.vimrc<CR>
" Reloads the .vimrc configuration
map <silent> zr :source ~\.vimrc<CR>

" Toggles NERDTree
map <silent> <F2> :NERDTreeToggle<CR>

" Fast q macro executor
map Q @q

" Duplicates current line
map <Space>d yyp

" Removes hightlight of the last search
map <silent> <Space>/ :noh<CR>
