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
			{ "<leader>c", group = "[c]ode" },
			{ "<leader>C", group = "[C]onfiguration" },
			{ "<leader>w", group = "[w]orkspace" },
			{ "<leader>d", group = "[d]ebug" },
		})
	end,
}
