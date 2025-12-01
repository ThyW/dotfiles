local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		local ok, comms = pcall(require, "todo-comments")
		if not ok then
			vim.notify("Could not load plugin: " .. M[1], vim.log.levels.ERROR)
			return
		end
		comms.setup({})

		vim.keymap.set("n", "]t", comms.jump_next, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", comms.jump_prev, { desc = "Previous todo comment" })
	end,
}

return M
