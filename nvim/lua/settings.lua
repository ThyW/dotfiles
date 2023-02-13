local o = vim.opt
local g = vim.g
local c = vim.cmd
local oo = vim.o


o.mouse = "a"
o.cmdheight = 1
o.updatetime = 500
o.complete:remove({ 'i' })
o.complete:append('kspell')
o.shortmess:append('c')
o.completeopt:append('menuone,noinsert,noselect')
o.clipboard = 'unnamedplus'
o.timeoutlen = 500
o.wrap = false
o.nu = true
o.rnu = true
o.signcolumn = 'yes'
o.showmode = false
o.autoindent = true
o.smartindent = true
o.copyindent = true
o.hlsearch = true

o.tabstop = 8
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = false

oo.runtimepath = oo.runtimepath .. ",~/.vim/"

o.listchars:append("space:·,eol:↵, ")
o.list = true

o.linebreak = true
o.breakindent = true

o.foldmethod = "indent"
o.foldlevelstart = 50

o.guifont = "SFMono Nerd Font Mono:h11"

o.splitright = true
o.splitbelow = true
function GetCurrentLang()
  return oo.spelllang
end

o.laststatus = 3
-- Custom status line:
-- (from the right):
--   * %f: relative filename.
--   * %=: move over to the other side(right side) of the status bar.
--   * %m: is the buffer modified?
--   * %Y: language
--   * %c: column
--   * %l/%L: current line number / out of all lines
oo.statusline = "<< %f >>%= %m %Y %c %l/%L "
-- append the current spell checker language onto the end of status line.
oo.statusline = oo.statusline .. " LANG:" .. "%{luaeval('GetCurrentLang()')}"
oo.statusline = oo.statusline .. " WORDS:" .. "%{luaeval('vim.fn.wordcount().words')}" .. " "

g.neovide_cursor_vfx_mode = "ripple"
g.neovide_cursor_animation_length = 0
g.neovide_cursor_trail_length = 0

c("filetype plugin indent on")
c("syntax on")
