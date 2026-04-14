local module = {
	src = "lervag/vimtex",
	config = function()
		vim.g.vimtex_view_method = "zathura_simple"
		vim.g.vimtex_view_forward_search_on_start = false
		vim.g.vimtex_mappings_prefix = "<localleader>v"
	end,
}

return module
