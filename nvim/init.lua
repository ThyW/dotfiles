-- structure inspiration taken from:
-- https://github.com/LunarVim/Launch.nvim/

require("core.spec")

require("core.aucmds")
require("core.settings")
require("core.keymaps")

plugin("plugins.colorscheme")
plugin("plugins.telescope")
plugin("plugins.treesitter")
plugin("plugins.surround")
plugin("plugins.kommentary")
plugin("plugins.luasnip")
plugin("plugins.cmp")
plugin("plugins.bufferline")
plugin("plugins.neorg")
plugin("plugins.fidget")
plugin("plugins.colorizer")
plugin("plugins.gitsigns")
plugin("plugins.mason")
plugin("plugins.conform")
plugin("plugins.nougat")

require("plugins.lazy")
