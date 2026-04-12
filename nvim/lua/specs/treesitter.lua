return {
	"neovim-treesitter/nvim-treesitter",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
