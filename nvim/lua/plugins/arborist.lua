local M = {
	src = "arborist-ts/arborist.nvim",
	version = "main",
	config = function()
		require("arborist").setup({
			update_cadence = "weekly",
		})
	end,
}

return M
