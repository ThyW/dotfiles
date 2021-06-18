-- adds mouse compatibility
vim.o.mouse = "a"
-- set the height of vim command line mode
vim.o.cmdheight = 1
-- set the update time for newly created .swp files for backups
vim.o.updatetime = 500
-- bulit in completion compatibility
vim.o.complete = "c"
-- use system clipboard
vim.o.clipboard = "unnamedplus"
--- 2 secs to wait for mapped key sequence
vim.o.timeoutlen = 2000
-- line numbres
vim.o.nu = true
-- relative line numbers
vim.o.rnu = false
-- column on the side for lsp warnings and what not
vim.o.signcolumn = true
-- don't show mode in which you are in
vim.o.showmode = false
-- automatically indent, use smart indentation and copy indentation from previous lines
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.copyindent = true
-- tabbing options, always use 4 spaces as tabs
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
-- fold by indentation
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 20
-- gui font
vim.o.guifont = "FiraCode:h14"
-- sane splits, always split to the right on vertical, and down on horizontal
vim.o.splitright = true
vim.o.splitbelow = true
-- enable syntax highlighting
vim.o.syntax = "enable"
-- do not wrap text by defult
vim.o.wrap = false
-- map leader to <Space>
vim.v.nvim_command([[let mapleader = ' ']])
