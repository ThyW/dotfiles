-- add a slash to folder names
vim.g.nvim_tree_addtrailing = 1

require 'nvim-tree'.setup {
  -- this is false by default:
  diagnostics = {
    enable = true,
  },
  renderer = {
    indent_markers = {
      enable = true
    },
  },
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "+", action = "cd" }
      }
    }
  },
  disable_netrw = true,
  hijack_netrw = true,
}
