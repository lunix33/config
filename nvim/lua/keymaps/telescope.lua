return {
	lazy = {
		{
			mode = "n",
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[f]ind [f]ile",
		},
		{
			mode = "n",
			"<leader>p",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "[p]reviourly open",
		},
		{
			mode = "n",
			"<leader>ft",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "[f]ind buffer [t]ext",
		},
		{
			mode = "n",
			"<leader>fT",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "[f]ind file [T]ext",
		},
		{
			mode = "n",
			"<leader>fc",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "[f]ind [c]ursor text",
		},
		{
			mode = "v",
			"<leader>fc",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "[f]ind [c]ursor text",
		},
		{
			mode = "n",
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "[f]ind [k]eymaps",
		},
		{
			mode = "n",
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "[f]ind [h]elp",
		},
		{
			mode = "n",
			"<leader>b<Enter>",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "[b]uffer select",
		},
		{
			mode = "n",
			"<leader>r",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "[r]esume (telescope)",
		},
		{
			mode = "n",
			"<leader>m",
			function()
				require("telescope.builtin").marks()
			end,
			desc = "[m]arks",
		},
		{
			mode = "n",
			"<leader>e",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" })
			end,
			desc = "File [e]xplorer",
		},
		{
			mode = "n",
			"<leader>Ce",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = vim.fn.stdpath("config") })
			end,
			desc = "[C]onfiguration [e]dit",
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
				end, "[f]ind code [d]iagnostic")
			end,
		})
	end,
}
