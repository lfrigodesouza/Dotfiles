local map = vim.keymap.set

-- Adds ; to the end of the line
map('n','<Space>;', 'm`A;<Esc>``')

-- Adds a line above or under current line
map('n', 'oo', 'm`o<Esc>``')
map('n', 'OO', 'm`O<Esc>``')

-- Opens .vimrc to edition
map('n', 'zl', ':e ~/.config/nvim/init.vim<CR>')

-- Reloads the .vimrc configuration
map('n', 'zr', ':source ~/.config/nvim/init.vim<CR>')

-- Toggles NERDTree
map('n', '<silent> <F2>', ':NERDTreeToggle<CR>')

-- Fast q macro executor
map('n', 'Q', '@q')

-- Duplicates current line
map('n','<Space>d', 'yyp')

-- Removes hightlight of the last search
map('n', '<silent> <Space>/', ':noh<CR>')
