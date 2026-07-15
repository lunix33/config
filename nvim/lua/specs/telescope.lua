local keymaps = require("keymaps.telescope")

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = "VimEnter",
	keys = keymaps.lazy,
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				file_browser = {
					hijack_netrw = true,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		keymaps.lsp()
	end,
}
