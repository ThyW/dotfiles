local M = {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			options = {
				signcolumn = "no", -- disable signcolumn
				-- number = false, -- disable number column
				-- relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		},
		plugins = {
			options = {
				enabled = true,
				laststatus = 0,
			},
		},
	},
}

vim.keymap.set("n", "<leader>oz", "<cmd>ZenMode<cr>", { noremap = true, silent = true, desc = "Toggle folke/zen-mode" })

return M
