call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
call plug#end()

packadd! dracula_pro

syntax enable

let g:dracula_colorterm = 0

colorscheme dracula_pro
