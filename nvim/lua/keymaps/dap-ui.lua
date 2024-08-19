return {
	{
		"<leader>du",
		function()
			require("dapui").toggle()
		end,
		desc = "[d]ebug toggle [u]i",
	},
}
