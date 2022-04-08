local g = vim.g
-- show indent markers when folders are open
g.nvim_tree_indent_markers = 1
-- add a slash to folder names
g.nvim_tree_addtrailing = 1

local nt_cb = require'nvim-tree.config'.nvim_tree_callback

local nt_list = {
    {key = "+", cb = nt_cb("cd")}
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
	    list = nt_list
	}
    },
    disable_netrw = true,
    hijack_netrw = true,
}
