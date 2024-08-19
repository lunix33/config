return {
	{
		"<leader>dc",
		function()
			require("dap").continue()
		end,
		desc = "[d]ebug [c]ontinue",
	},
	{
		"<leader>di",
		function()
			require("dap").step_into()
		end,
		desc = "[d]ebug step [i]nto",
	},
	{
		"<leader>do",
		function()
			require("dap").step_over()
		end,
		desc = "[d]ebug step [o]ver",
	},
	{
		"<leader>dO",
		function()
			require("dap").step_out()
		end,
		desc = "[d]ebug step [O]ut",
	},
	{
		"<leader>db",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "[d]ebug toggle [b]reakpoint",
	},
	{
		"<leader>dB",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		desc = "[d]ebug set [B]reakpoint with condition",
	},
}
