local M = {
	"yousefhadder/markdown-plus.nvim",
	ft = { "markdown", "txt", "text" }, -- Load on markdown files by default
	config = function()
		require("markdown-plus").setup({
			filetypes = { "markdown", "txt", "text" },
		})
	end,
}

return M
