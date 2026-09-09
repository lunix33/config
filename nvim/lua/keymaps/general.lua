-- Buffer nav
vim.keymap.set("n", "<leader>bxx", function()
	vim.cmd.bdelete({ mods = { confirm = true } })
end, { desc = "Buffer: Close: Current" })
--	horizontal split
vim.keymap.set("n", "<leader>bh", function()
	vim.cmd.split()
end, { desc = "Buffer: Horizontal split" })
--	vertical split
vim.keymap.set("n", "<leader>bv", function()
	vim.cmd.vsplit()
end, { desc = "Buffer: Vertical split" })

-- Open :terminal
vim.keymap.set("n", "<leader>t<Enter>", vim.cmd.terminal, { desc = "Terminal: New window" })
-- Open :terminal (split bottom)
vim.keymap.set("n", "<leader>th", function()
	vim.cmd.terminal({ mods = { horizontal = true } })
end, { desc = "Terminal: Horizontal split" })
-- Open :terminal (split right)
vim.keymap.set("n", "<leader>tv", function()
	vim.cmd.terminal({ mods = { vertical = true } })
end, { desc = "Terminal: Vertical split" })

-- Exit terminal mode with double ESC.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Terminal: Exit terminal mode" })
-- Clear search highlights with ESC.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
