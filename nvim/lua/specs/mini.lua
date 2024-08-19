return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.icons").setup()
		require("mini.surround").setup()
		require("mini.sessions").setup({ autoread = true })
		require("mini.move").setup({
			mappings = {
				left = "<M-Left>",
				right = "<M-Right>",
				down = "<M-Down>",
				up = "<M-Up>",
				line_left = "<M-Left>",
				line_right = "<M-Right>",
				line_down = "<M-Down>",
				line_up = "<M-Up>",
			},
		})
	end,
}
