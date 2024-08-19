return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "rust", "html", "css", "typescript", "javascript", "lua", "markdown" },
		auto_install = true,
		ignore_install = {},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
	config = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
}
