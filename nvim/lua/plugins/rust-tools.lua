M = {
  tools = { -- rust-tools options
    autoSetHints = true,
    hover_with_actions = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = ":",
      show_variable_name = true,
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },

    hover_actions = {
      border = "rounded",
      auto_focus = false
    },
    crate_graph = {
      backend = "x11",
      output = nil,
      full = true,
    }
  },
  server = {
    standalone = false,
    settings = {
      ["rust_analyzer"] = {
        checkOnSave = {
          enable = true,
          command = "clippy"
        },
        procMacro = {
          enable = true
        },
        completion = {
          postfix = {
            enable = false
          }
        }
      }
    }
  }
}

return M
