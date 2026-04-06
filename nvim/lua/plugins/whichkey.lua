local M = {
	src = "folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup()
	end
}

return M
