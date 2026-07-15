return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.nvim",
	},
	event = "VimEnter",
	opts = {
		spec = {
			{ "<leader>b", group = "[b]uffer" },
			{ "<leader>f", group = "[f]ind" },
			{ "<leader>t", group = "[t]erminal" },
			{ "<leader>C", group = "[C]onfiguration" },
			{ "<leader>d", group = "[d]ebug" },
			{ "gr", group = "LSP" },
			{ "gra", mode = "n", desc = "Code action" },
			{ "grn", mode = "n", desc = "Rename symbol" },
			{ "gq", group = "Format" }
		},
	},
}
