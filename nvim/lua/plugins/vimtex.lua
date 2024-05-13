local module = {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura_simple"
		vim.cmd([[let g:vimtex_view_foward_search_on_start = 0]])
	end,
}

return module
