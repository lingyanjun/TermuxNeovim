return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
	},
	ft = { "cpp", "c" },
	config = function()
		local dap = require("dap")

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.configurations.cpp = {
			{
				name = "Launch with gdb",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				setupCommands = {
					{
						description = "Enable pretty-printing for gdb",
						ignoreFailures = true,
						text = "-enable-pretty-printing",
					},
				},
			},
		}

		dap.configurations.c = dap.configurations.cpp

		require("nvim-dap-virtual-text").setup()

		local dapui = require("dapui")
		dapui.setup({
			expand_lines = false,
			layouts = {
				{
					position = "left",
					size = 0.2,
					elements = {
						{ id = "stacks",      size = 0.2 },
						{ id = "scopes",      size = 0.5 },
						{ id = "breakpoints", size = 0.15 },
						{ id = "watches",     size = 0.15 },
					},
				},
				{
					position = "bottom",
					size = 0.2,
					elements = {
						{ id = "repl",    size = 0.3 },
						{ id = "console", size = 0.7 },
					},
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({ reset = true })
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

		vim.keymap.set("n", "<leader>du", function()
			dapui.toggle({ reset = true })
		end, { desc = "DAP: Toggle UI" })
		vim.keymap.set("n", "<leader>ds", function()
			dap.continue()
		end, { desc = "Start/Continue" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
		vim.keymap.set("n", "<leader>dq", dap.close, { desc = "DAP: Close session" })
		vim.keymap.set("n", "<leader>dr", dap.restart_frame, { desc = "DAP: Restart frame" })
		vim.keymap.set("n", "<leader>dQ", dap.terminate, { desc = "Terminate session" })
		vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })
		vim.keymap.set("n", "<leader>dR", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
		vim.keymap.set("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "DAP: Hover" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			local input = vim.fn.input("Condition for breakpoint:")
			dap.set_breakpoint(input)
		end, { desc = "DAP: Conditional Breakpoint" })
		vim.keymap.set("n", "<leader>dD", dap.clear_breakpoints, { desc = "DAP: Clear Breakpoints" })
	end,
}
