require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
	"c_sharp",
	"lua",
	"python",
	"javascript",
	"typescript",
	"markdown",
	"bash",
	"dockerfile",
	"html",
	"json",
	"yaml",
	"vim",
	"css"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}