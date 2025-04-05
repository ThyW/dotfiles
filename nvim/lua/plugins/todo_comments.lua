local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		local comms = require("todo-comments")
		comms.setup({})

		vim.keymap.set("n", "]t", comms.jump_next, { desc = "Next todo comment" })

		vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<CR>", { desc = "TScope todo comments" })

		vim.keymap.set("n", "[t", comms.jump_prev, { desc = "Previous todo comment" })
	end,
}

return M
