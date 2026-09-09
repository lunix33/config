return {
	{
		"<leader>dc",
		function()
			require("dap").continue()
		end,
		desc = "Debug: Continue",
	},
	{
		"<leader>di",
		function()
			require("dap").step_into()
		end,
		desc = "Debug: Step into",
	},
	{
		"<leader>do",
		function()
			require("dap").step_over()
		end,
		desc = "Debug: step over",
	},
	{
		"<leader>dO",
		function()
			require("dap").step_out()
		end,
		desc = "Debug: Step out",
	},
	{
		"<leader>db",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "Debug: Toggle breakpoint",
	},
	{
		"<leader>dB",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		desc = "Debug: Set breakpoint with condition",
	},
}
