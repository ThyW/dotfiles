vim.o.colorscheme = "gruvbox"
vim.o.termguicolors = true

vim.api.nvim_exec([[
highlight SignColumn guibg=none
highlight LineNr ctermfg=240
highlight CursorLineNr cterm=bold gui=bold guibg=none
highlight Pmenu ctermfg=white ctermbg=22 cterm=bold
highlight SpellBad ctermfg=red ctermbg=black cterm=underline 
highlight StatusLine ctermfg=black ctermbg=gray guibg=#efc169
highlight ColorColumn ctermbg=none
highlight Conceal ctermbg=none
highlight LspDiagnosticsError ctermfg=red
highlight LspDiagnosticsWarning ctermfg=cyan
highlight LspDiagnosticsInformation ctermfg=grey
]])
