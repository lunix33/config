local save_disabled_ft = {
	c = true,
	cpp = true,
}

return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	keys = require('keymaps.conform').lazy,
	opts = {
		format_on_save = function(bufnr)
			return {
				timeout_ms = 500,
				lsp_fallback = not save_disabled_ft[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { 'stylua' }
		},
	}
}
