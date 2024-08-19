return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = require("keymaps.cmp")(),
			sources = cmp.config.sources({
				{ name = "lazydev", group_index = 0 },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
