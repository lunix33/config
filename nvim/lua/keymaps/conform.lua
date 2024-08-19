return {
	lazy = {
		{
			"<leader>bf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "[b]uffer [f]ormat",
		},
	},
}
