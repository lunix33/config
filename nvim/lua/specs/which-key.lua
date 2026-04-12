return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.nvim",
	},
	event = "VimEnter",
	opts = {},
	config = function()
		require("which-key").add({
			{ "<leader>b", group = "[b]uffer" },
			{ "<leader>f", group = "[f]ind" },
			{ "<leader>t", group = "[t]erminal" },
			{ "<leader>C", group = "[C]onfiguration" },
			{ "<leader>d", group = "[d]ebug" },
			{ "gr", group = "LSP" },
		})
	end,
}
