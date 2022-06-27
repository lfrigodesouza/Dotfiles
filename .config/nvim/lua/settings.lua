local set = vim.opt
-- Basic
set.number = true
set.ruler = true
set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.autoindent = true
set.smartcase = true
set.relativenumber = true
set.cursorline = true
set.cursorcolumn = true
set.compatible = false

-- Custom
set.timeoutlen = 200 -- Timeout between two keystrokes
set.clipboard = "unnamedplus" -- Make possible to paste from clipboard
set.tabstop = 4 
set.softtabstop = 0 
set.expandtab = true
set.shiftwidth = 4 
set.laststatus = 2
set.encoding = "utf-8"
set.spell.spelllang = {'pt_br','en_us'}
