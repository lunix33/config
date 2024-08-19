-- Buffer nav
--	next
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "[b]uffer [n]ext" })
--	previous
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious, { desc = "[b]uffer [p]revious" })
--	close
vim.keymap.set("n", "<leader>bx", function()
	vim.cmd.bdelete({ mods = { confirm = true } })
end, { desc = "[b]uffer e[x]it" })

-- Open :terminal
vim.keymap.set("n", "<leader>t<Enter>", vim.cmd.terminal, { desc = "[t]erminal window" })
-- Open :terminal (split bottom)
vim.keymap.set("n", "<leader>ts", function()
	vim.cmd.terminal({ mods = { horizontal = true } })
end, { desc = "[t]erminal horizontal [s]plit" })
-- Open :terminal (split right)
vim.keymap.set("n", "<leader>tv", function()
	vim.cmd.terminal({ mods = { vertical = true } })
end, { desc = "[t]erminal [v]ertical split" })

-- Exit terminal mode with double ESC.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Clear search highlights with ESC.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
