local M = {
	"norcalli/nvim-colorizer.lua",
	lazy = false,
}

M.config = function()
	require("colorizer").setup({ "*" })
end

return M
