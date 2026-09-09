return {
	{
		mode = "n",
		"<leader>bn",
		function()
			vim.cmd.BufferLineCycleNext()
		end,
		desc = "Buffer: Next",
	},
	{
		mode = "n",
		"<leader>bp",
		function()
			vim.cmd.BufferLineCyclePrev()
		end,
		desc = "Buffer: Previous",
	},
	{
		mode = "n",
		"<leader>bxX",
		function()
			vim.cmd.BufferLineCloseOthers()
		end,
		desc = "Buffer: Close: Others",
	},
	{
		mode = "n",
		"<leader>bx<Left>",
		function()
			vim.cmd.BufferLineCloseLeft()
		end,
		desc = "Buffer: Close: Left",
	},
	{
		mode = "n",
		"<leader>bx<Right>",
		function()
			vim.cmd.BufferLineCloseRight()
		end,
		desc = "Buffer: Close: Right",
	},
	{
		mode = "n",
		"<leader>b<Left>",
		function()
			vim.cmd.BufferLineMovePrev()
		end,
		desc = "Buffer: Move left",
	},
	{
		mode = "n",
		"<leader>b<Right>",
		function()
			vim.cmd.BufferLineMoveNext()
		end,
		desc = "Buffer: Move right",
	},
}
