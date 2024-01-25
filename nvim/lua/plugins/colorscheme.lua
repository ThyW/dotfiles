local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "rktjmp/lush.nvim" },
}

M.config = function()
	require("gruvbox").setup()

	vim.opt.background = "dark"
	vim.cmd("colorscheme gruvbox")

	local highlights = {
		"highlight SignColumn guibg=none",
		"highlight LineNr ctermfg=240",
		"highlight CursorLineNr cterm=bold gui=bold guibg=none",
		"highlight Pmenu ctermfg=red ctermbg=red " .. "cterm=bold guifg=#fabd2f " .. "guibg=#292929",
		"highlight SpellBad guifg=red guibg=black gui=underline ",
		"highlight StatusLine ctermfg=black " .. "ctermbg=gray guibg=#efc169 " .. "guifg=#504945",
		"highlight StatusLineNC guibg=#efc169 guifg=#3c3836",
		"highlight ColorColumn ctermbg=none",
		"highlight Conceal ctermbg=none",
		"highlight LspDiagnosticsError ctermfg=red",
		"highlight LspDiagnosticsWarning ctermfg=cyan",
		"highlight LspDiagnosticsInformation ctermfg=grey",
	}

	for _, v in ipairs(highlights) do
		vim.cmd(v)
	end
end

return M
