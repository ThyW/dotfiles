vim.opt.wrap = false
vim.opt.spell = false

vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set expandtab")

local rm = require("render-markdown")

rm.enable()

-- enable tree-sitter highlighting
vim.treesitter.start()
