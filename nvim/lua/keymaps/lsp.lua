vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach-keymaps", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = event.buf, desc = desc })
		end

		map("gD", vim.lsp.buf.declaration, "[g]o to [D]eclaration")
		map("K", vim.lsp.buf.hover, "LSP hover")
		map("<C-k>", vim.lsp.buf.signature_help, "LSP cursor signature help")
		map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[w]orkspace [a]dd")
		map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[w]orkspace [r]emove")
		map("<leader>w<Enter>", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, "[w]orkspace list")
		map("<leader>cr", vim.lsp.buf.rename, "[c]ode [r]ename symbol")
		map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
		map("<leader>k", vim.diagnostic.open_float, "LSP diagnostic float")
		map("[d", vim.diagnostic.goto_prev, "LSP previous diagnostic")
		map("]d", vim.diagnostic.goto_next, "LSP next diagnostic")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			map("<leader>ci", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[c]ode toggle [i]nlay hints")
		end
	end,
})
