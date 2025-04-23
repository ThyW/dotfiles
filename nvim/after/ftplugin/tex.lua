vim.o.spell = true

vim.cmd("TSDisable highlight")
vim.cmd("set expandtab")

local f = require("core.lib.functions")
f.switch_wrap(true)
