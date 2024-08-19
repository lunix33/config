return function()
	local cmp = require("cmp")
	return cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-Down>"] = cmp.mapping.scroll_docs(4),
		["<C-Up>"] = cmp.mapping.scroll_docs(-4),
	})
end
