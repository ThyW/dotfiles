local M = {
	"yousefhadder/markdown-plus.nvim",
	ft = { "markdown", "txt", "text" }, -- Load on markdown files by default
	config = function()
		local ok, md = pcall(require, "markdown-plus")
		if not ok then
			vim.notify("Could not load plugin: " .. M[1], vim.log.levels.ERROR)
			return
		end
		md.setup({
			filetypes = { "markdown", "txt", "text" },
		})
	end,
}

return M
