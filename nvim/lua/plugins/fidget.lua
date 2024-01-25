local M = {
	"j-hui/fidget.nvim",
	lazy = false,
}

M.config = function()
	require("fidget").setup({})
end

return M
