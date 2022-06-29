local cmd = vim.cmd
local g = vim.g
--Dracula PRO theme
cmd "packadd! dracula_pro"
g.dracula_colorterm = 0
cmd "colorscheme dracula_pro"

-- Vim Airline
g.airline_powerline_fonts = 1
g.airline_theme='dracula_pro'
