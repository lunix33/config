local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		default_format_opts = {
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },

			javascript = prettier,
			javascriptreact = prettier,
			typescript = prettier,
			typescriptreact = prettier,
			css = prettier,
			html = prettier,
			json = prettier,
			yaml = prettier,
			markdown = prettier,
		},

		format_on_save = function(bufnr)
			if not vim.g.autoformat then
				return
			end

			return {
				timeout_ms = 500,
			}
		end,
	},
	init = function()
		vim.g.autoformat = true
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
