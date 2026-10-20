---@type table<string, string>
OVERRIDES = {}

---Get the language associated with the file if possible.
---@param ft string The file type associated with the buffer.
---@return string|nil The language if compatible, otherwise nil.
function get_lang(ft)
	local lang = OVERRIDES[ft] or vim.treesitter.language.get_lang(ft)
	if lang and vim.tbl_contains(require("nvim-treesitter").get_available(), lang) then
		return lang
	end
end

---Ensure the treesitter parser is installed
---@param lang string The language to install
function install(lang)
	local treesitter = require("nvim-treesitter")

	if vim.treesitter.language.add(lang) then
		return
	end

	treesitter.install(lang, { generate = true, summary = true }):wait(30000)
	vim.treesitter.language.add(lang)
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo.filetype
				local lang = get_lang(ft)

				if not lang then
					vim.api.nvim_echo(
						{ { string.format("Treesitter: no usable parser for: %s", ft), "Warning" } },
						false,
						{}
					)
					vim.wo.foldmethod = "indent"
				else
					install(lang)

					vim.api.nvim_echo({ { string.format("Treesitter: using %s", lang), "Normal" } }, false, {})

					-- Enable highlighting
					vim.treesitter.start(args.buf, lang)

					-- Enable code folding
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo.foldmethod = "expr"

					-- Enable code indent
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
