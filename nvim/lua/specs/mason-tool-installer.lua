return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		ensure_installed = {
			-- lsp
			"bashls",
			"lua_ls",
			"rust-analyzer",
			"eslint-lsp",
			"lua-language-server",
			-- dap
			"codelldb",
			-- linters
			"cspell",
			"eslint_d",
			-- formatters
			"rustfmt",
			"prettier",
			"stylua",
		},
	},
}
