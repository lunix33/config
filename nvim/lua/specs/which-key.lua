return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.nvim",
	},
	event = "VimEnter",
	opts = {
		spec = {
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bx", group = "Buffer: Close" },
			{ "<leader>f", group = "Find" },
			{ "<leader>t", group = "Terminal" },
			{ "<leader>C", group = "Configuration" },
			{ "<leader>d", group = "Debug" },
			{ "gr", group = "LSP" },
			{ "gra", mode = "n", desc = "Code action" },
			{ "grn", mode = "n", desc = "Rename symbol" },
			{ "gq", group = "Format" },
		},
	},
}
