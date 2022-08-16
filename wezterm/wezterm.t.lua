local w = require("wezterm")

M = {}

local gruvbox = w.get_builtin_color_schemes()["Gruvbox Dark"]
gruvbox.background = "#282828"

-- M.color_scheme = "Gruvbox dark, medium (base16)"
M.font = w.font("JetBrainsMono Nerd Font")
M.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
M.enable_tab_bar = false
M.use_fancy_tab_bar = false
M.default_prog = { "/bin/sh", "-c", "tmux", "-u" }
M.cell_width = 0.90
M.font_size = 12.0
M.color_schemes = {
  ["My Gruvbox"] = gruvbox
}
M.color_scheme = "My Gruvbox"

M.window_padding = {
  top = 0,
  bottom = 0,
  left = 0,
  right = 0,
}

return M
