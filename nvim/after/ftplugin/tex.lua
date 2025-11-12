vim.o.spell = true

vim.cmd("set expandtab")
require("core.lib.functions").switch_wrap(true)

-- do not use tree-sitter in TeX
-- vim.treesitter.start()
