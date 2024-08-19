vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- see: https://neovim.io/doc/user/options.html#_3.-options-summary
vim.opt.mouse = "a"
vim.opt.timeoutlen = 300
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.swapfile = true
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.undolevels = 1000

vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80,100,120"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = {
	eol = "⤶",
	tab = "<->",
	multispace = "·",
	lead = "·",
	trail = "●",
	precedes = "«",
	extends = "»",
	nbsp = "_",
}

vim.opt.scrolloff = 10
vim.opt.foldlevelstart = 99

--vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.showmatch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.fileformat = "unix"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
