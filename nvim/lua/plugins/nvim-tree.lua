local g = vim.g
-- show indent markers when folders are open
g.nvim_tree_indent_markers = 1
-- add a slash to folder names
g.nvim_tree_addtrailing = 1

local nvim_tree_callback = require'nvim-tree.config'.nvim_tree_callback

local nvim_tree_list = {
    {key = "+", cb = nvim_tree_callback("cd")}
}
require'nvim-tree'.setup {
    -- this is false by default:
    diagnostics = {
	enable = true,
    },
    view = {
    	width = 30,
    	height = 30,
    	auto_resize = true,
	mappings = {
	    list = nvim_tree_list
	}
    },
    auto_close = true,
    disable_netrw = true,
    hijack_netrw = true,
}
