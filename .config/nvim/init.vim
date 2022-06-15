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

" Load pluggins
lua require('plugins')

" auto install vim-plug plugins on install:
if plug_install
    PlugInstall --sync
endif
unlet plug_install

""" SETTINGS
" Basic
lua require('settings')

" Custom

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

" Treesitter
lua require('treesitter')

""" Key mappings
lua require('config.keymappings')
