return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	keys = require("keymaps.dap-ui"),
	opts = {},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.listeners.after.event_initialized.dapui_config = dapui.open
		dap.listeners.before.event_terminated.dapui_config = dapui.close
		dap.listeners.before.event_exited.dapui_config = dapui.close
	end,
}
