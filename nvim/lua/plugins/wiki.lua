local M = {
	src = "lervag/wiki.vim",
	-- tag = "v0.10", -- uncomment to pin to a specific release
	config = function()
		vim.g.wiki_root = "~/wiki/"
	end,
}

return M
