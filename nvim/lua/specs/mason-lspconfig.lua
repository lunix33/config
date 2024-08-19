return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	opts = {},
	config = function()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local server = require("lsp_settings")[server_name] or {}
				local nvim_cap = vim.lsp.protocol.make_client_capabilities()
				local cmp_cap = require("cmp_nvim_lsp").default_capabilities()
				server.capabilities = vim.tbl_deep_extend("force", nvim_cap, cmp_cap, server.capabilities or {})

				require("lspconfig")[server_name].setup(server)
			end,
			["rust_analyzer"] = function() end,
		})
	end,
}
