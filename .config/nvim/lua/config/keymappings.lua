local map = vim.keymap.set

-- Adds ; to the end of the line
map('n','<Space>;', 'm`A;<Esc>``')

-- Adds a line above or under current line
map('n', 'oo', 'm`o<Esc>``')
map('n', 'OO', 'm`O<Esc>``')

-- Opens .vimrc to edition
map('n', 'zl', ':e ~/.config/nvim/init.lua<CR>')

-- Reloads the .vimrc configuration
map('n', 'zr', ':source ~/.config/nvim/init.lua<CR>')

-- Fast q macro executor
map('n', 'Q', '@q')

-- Duplicates current line
map('n','<Space>d', 'yyp')

-- Removes hightlight of the last search
map('n', '<Space>/', ':noh<CR>')

---- Plugins
-- Startify
map('n', '<A-n>', '<Cmd>Startify<CR>')

-- NvimTree
map('n', '<F2>', ':NvimTreeToggle<CR>')

-- Telescope
map('n', '<Space>ff', ':Telescope find_files<CR>')
map('n', '<Space>fb', ':Telescope buffers<CR>')

-- Barbar
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Tagbar
map('n', '<F8>', '<Cmd>TagbarToggle<CR>')
