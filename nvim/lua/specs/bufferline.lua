return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VimEnter",
	opts = {
		options = {
			themable = true,
			diagnostics = "nvim_lsp",
			numbers = "lower",
			separator_style = "slope",
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
	},
}
