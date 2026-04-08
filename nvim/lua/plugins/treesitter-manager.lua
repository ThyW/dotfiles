local M = {
	src = "romus204/tree-sitter-manager.nvim",
	version = "main",
	config = function()
		require("tree-sitter-manager").setup({})
	end,
}

return M
