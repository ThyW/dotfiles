local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
		"https://github.com/igorlfs/nvim-dap-view",
	},
	config = function()
		local keymap = vim.keymap.set

		local function opts(desc, callback)
			return { silent = true, noremap = true, desc = desc, callback or nil }
		end

		local ok, dap = pcall(require, "dap")
		if not ok then
			vim.notify("could not load nvim-dap", vim.log.levels.ERROR)
			return
		end

		-- GDB-C adapters
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		-- GDB-Rust adapter
		dap.adapters["rust-gdb"] = {
			type = "executable",
			command = "rust-gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		-- GDB-C configurations
		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				args = {}, -- provide arguments if needed
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to gdbserver :1234",
				type = "gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
			},
		}
		-- GDB-Rust configuration
		dap.configurations.rust = {
			{
				name = "Launch",
				type = "rust-gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				args = {}, -- provide arguments if needed
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "rust-gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to gdbserver :1234",
				type = "rust-gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
			},
		}

		local ok, dap_virt_text = pcall(require, "nvim-dap-virtual-text")
		if not ok then
			vim.notify("Could not load plugin: nvim-dap-virtual-text")
			return
		end
		dap_virt_text.setup({})

		-- Toggle nvim-dap-view
		keymap("n", "<leader>dv", ":DapViewToggle<cr>", opts("Toggle nvim-dap-view"))

		-- Manipulating DAP
		keymap("n", "<leader>dc", function()
			dap.continue()
		end, opts("Start/Continue debugging"))

		keymap("n", "<leader>dr", function()
			dap.restart()
		end, opts("Restart debug adapter"))
		keymap("n", "<leader>dq", function()
			dap.terminate()
		end, opts("Terminate debug adapter"))
		keymap("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, opts("Toggle breakpoint"))
		keymap("n", "<leader>dC", function()
			dap.clear_breakpoints()
		end, opts("Clear breakpoints"))
	end,
}

return M
