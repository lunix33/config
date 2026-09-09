return {
	lazy = {
		{
			mode = "n",
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find: File",
		},
		{
			mode = "n",
			"<leader>p",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Previourly open",
		},
		{
			mode = "n",
			"<leader>ft",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Find: Buffer text",
		},
		{
			mode = "n",
			"<leader>fT",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find: File text",
		},
		{
			mode = "n",
			"<leader>fc",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Find: Cursor text",
		},
		{
			mode = "v",
			"<leader>fc",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Find: Cursor text",
		},
		{
			mode = "n",
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Find: Keymap",
		},
		{
			mode = "n",
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Find: Help",
		},
		{
			mode = "n",
			"<leader>b<Enter>",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Buffer: Select",
		},
		{
			mode = "n",
			"<leader>r",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "Resume (telescope)",
		},
		{
			mode = "n",
			"<leader>m",
			function()
				require("telescope.builtin").marks()
			end,
			desc = "Marks",
		},
		{
			mode = "n",
			"<leader>e",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" })
			end,
			desc = "File explorer",
		},
		{
			mode = "n",
			"<leader>Ce",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = vim.fn.stdpath("config") })
			end,
			desc = "Edit configuration",
		},
		-- To consider:
		-- - quickfix
		-- - marks
		-- - loclist
	},
	lsp = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach-keymaps-telescope", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = event.buf, desc = desc })
				end

				map("grd", function()
					require("telescope.builtin").lsp_definitions()
				end, "Symbol definition")
				map("grr", function()
					require("telescope.builtin").lsp_references()
				end, "Symbol references")
				map("gri", function()
					require("telescope.builtin").lsp_implementations()
				end, "Symbol implementations")
				map("grt", function()
					require("telescope.builtin").lsp_type_definitions()
				end, "Type definition")
				map("gO", function()
					require("telescope.builtin").lsp_document_symbols()
				end, "[LSP] Document symbols")

				map("<leader>fd", function()
					require("telescope.builtin").diagnostics()
				end, "Find: Code diagnostic")
			end,
		})
	end,
}
