return {
	{
		"<leader>du",
		function()
			require("dapui").toggle()
		end,
		desc = "Debug: Toggle ui",
	},
}
