-- buffer bar & status bar

require("lazy").setup({
	spec = { { import = "specs" } },
	install = {
		colorscheme = { "onelight" },
	},
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
vim.keymap.set("n", "<leader>Cl", vim.cmd.Lazy, { desc = "[C]onfiguration [l]azy" })
