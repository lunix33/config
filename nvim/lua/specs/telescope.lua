local keymaps = require("keymaps.telescope")

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = "VimEnter",
	keys = keymaps.lazy,
	opts = {
		extensions = {
			file_browser = {
				hijack_netrw = true,
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	},
	config = function()
		local plugin = require("telescope")

		pcall(plugin.load_extension, "fzf")
		pcall(plugin.load_extension, "ui-select")
		pcall(plugin.load_extension, "file_browser")

		keymaps.lsp()
	end,
}
