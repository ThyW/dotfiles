local o = vim.opt
local g = vim.g
local f = vim.fn
local c = vim.cmd

o.mouse = "a"
o.cmdheight = 1
o.updatetime = 500
o.complete:remove({'i'})
o.complete:append('kspell')
o.shortmess:append('c')
o.completeopt:append('menuone,noinsert,noselect')
o.clipboard = 'unnamedplus'
o.timeoutlen = 2000
o.wrap = false
o.nu = true
o.rnu = true
o.signcolumn = 'yes'
o.showmode = false
o.autoindent = true
o.smartindent = true
o.copyindent = true

o.tabstop = 8
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = false

o.linebreak = true
o.breakindent = true

-- o.colorcolumn = 80

o.foldmethod = "indent"
o.foldlevelstart = 20

o.guifont = "FiraCode:h14"

--[[ if vim.fn.has("nvim") == 1 then
   o.viminfo:append({'n~/.local/share/nvim/shada/main.shada'})
end ]]

o.splitright = true
o.splitbelow = true

o.laststatus = 2
o.statusline = "<< %f >>%= %m %Y %c %l/%L"

o.termguicolors = true

c("filetype plugin indent on")
c("syntax on")
c("colorscheme gruvbox")

local highlights = {
    "highlight SignColumn guibg=none",
    "highlight LineNr ctermfg=240",
    "highlight CursorLineNr cterm=bold gui=bold guibg=none",
    "highlight Pmenu ctermfg=white ctermbg=22 cterm=bold",
    "highlight SpellBad ctermfg=red ctermbg=black cterm=underline ",
    "highlight StatusLine ctermfg=black ctermbg=gray guibg=#efc169",
    "highlight ColorColumn ctermbg=none",
    "highlight Conceal ctermbg=none",
    "highlight LspDiagnosticsError ctermfg=red",
    "highlight LspDiagnosticsWarning ctermfg=cyan",
    "highlight LspDiagnosticsInformation ctermfg=grey"
}

for _, v in ipairs(highlights) do
    c(v)
end

g.mapleader = ' '

c[[autocmd Filetype php set filetype=html]]
