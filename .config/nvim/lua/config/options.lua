local set = vim.opt

set.backup = false                          -- creates a backup file
set.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
set.cmdheight = 2                           -- more space in the neovim command line for displaying messages
set.completeopt = { "menuone", "noselect" } -- mostly just for cmp
set.conceallevel = 0                        -- so that `` is visible in markdown files
set.fileencoding = "utf-8"                  -- the encoding written to a file
set.hlsearch = true                         -- highlight all matches on previous search pattern
set.ignorecase = true                       -- ignore case in search patterns
set.mouse = "a"                             -- allow the mouse to be used in neovim
set.pumheight = 10                          -- pop up menu height
set.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
set.showtabline = 2                         -- always show tabs
set.smartcase = true                        -- smart case
set.smartindent = true                      -- make indenting smarter again
set.splitbelow = true                       -- force all horizontal splits to go below current window
set.splitright = true                       -- force all vertical splits to go to the right of current window
set.swapfile = false                        -- creates a swapfile
set.timeoutlen = 200                       -- time to wait for a mapped sequence to complete (in milliseconds)
set.undofile = true                         -- enable persistent undo
set.updatetime = 300                        -- faster completion (4000ms default)
set.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.expandtab = true                        -- convert tabs to spaces
set.shiftwidth = 4                          -- the number of spaces inserted for each indentation
set.tabstop = 4                             -- insert 2 spaces for a tab
set.softtabstop = 0
set.cursorline = true                       -- highlight the current line
set.number = true                           -- set numbered lines
set.ruler = true
set.incsearch = true
set.cursorline = true
set.cursorcolumn = true
set.compatible = false
set.laststatus = 2
set.relativenumber = true                   -- set relative numbered lines
set.numberwidth = 4                         -- set number column width to 2 {default 4}
set.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
set.wrap = false                            -- display lines as one long line
set.scrolloff = 8                           -- is one of my fav
set.sidescrolloff = 8
set.guifont = "FiraCode Nerd Font:h11"               -- the font used in graphical neovim applications
set.termguicolors = true
set.spell.spelllang = {'pt_br','en_us'}

set.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»]]
vim.cmd [[set list]]
