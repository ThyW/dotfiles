local module = {
	src = "lervag/vimtex",
	lazy = false,
	config = function()
		vim.g.vimtex_view_method = "zathura_simple"
		vim.g.vimtex_view_forward_search_on_start = false
	end,
}

return module
