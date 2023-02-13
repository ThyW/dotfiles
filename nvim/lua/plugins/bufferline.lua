require 'bufferline'.setup {
  options = {
    numbers = "buffer_id",
    close_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    diagnostics = "nvim_lsp",
    show_buffer_icons = true,
    always_show_bufferline = true,
    separator_style = "thin",
    offsets = { { filetype = "NvimTree", text = "File Explorer" } }
  },

  highlights = {
    separator_selected = {
      fg = "#504945",
      bg = "none"
    },
    separator_visible = {
      fg = "#504945",
      bg = "none"
    },
    separator = {
      fg = "#504945",
      bg = "none"
    },
    buffer = {
      fg = "#ebdbb2"
    }
  }
}
