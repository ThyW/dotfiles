local w = require("wezterm")
local a = w.action

M = {}

w.on(
  "format-tab-title",
  function(tab, _, _, _, _, mw)
    local bg = "#282828"
    local fg = "#928374"
    local function basename(s)
      return string.gsub(s, '(.*[/\\])(.*)', '%2')
    end
    local name = basename(tab.active_pane.foreground_process_name)
    local title = w.truncate_right(name, mw - 2)
    if tab.is_active then
        fg = "#b16286"
    end

    return {
      { Attribute = { Intensity = "Bold" } },
      { Background = { Color = bg } },
      { Foreground = { Color = fg } },
      { Text = "[ " .. title .. " ] " }
    }
  end
)


local gruvbox = w.get_builtin_color_schemes()["Gruvbox Dark"]
gruvbox.background = "#282828"
gruvbox.tab_bar = {
  background = gruvbox.background
}

local keybinds = {
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 10000 },
  keys = {
    {
      key = "h",
      mods = "LEADER",
      action = a.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
      key = "v",
      mods = "LEADER",
      action = a.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
      key = "x",
      mods = "LEADER",
      action = a.CloseCurrentPane { confirm = false }
    },
    {
      key = "l",
      mods = "ALT",
      action = a.ActivatePaneDirection 'Right'
    },
    {
      key = "h",
      mods = "ALT",
      action = a.ActivatePaneDirection 'Left'
    },
    {
      key = "j",
      mods = "ALT",
      action = a.ActivatePaneDirection 'Down'
    },
    {
      key = "k",
      mods = "ALT",
      action = a.ActivatePaneDirection 'Up'
    },
    {
      key = "n",
      mods = "ALT",
      action = a.ActivateTabRelative(1),
    },
    {
      key = "p",
      mods = "ALT",
      action = a.ActivateTabRelative(-1),
    },
    {
      key = "n",
      mods = "ALT|SHIFT",
      action = a.MoveTabRelative(1),
    },
    {
      key = "p",
      mods = "ALT|SHIFT",
      action = a.MoveTabRelative(-1),
    },
    {
      key = 'r',
      mods = 'LEADER',
      action = a.ReloadConfiguration,
    },
    {
      key = 'c',
      mods = 'LEADER',
      action = a.SpawnTab 'CurrentPaneDomain'
    }
  }
}


-- M.color_scheme = "Gruvbox dark, medium (base16)"
M.font = w.font("JetBrainsMono Nerd Font")
M.harfbuzz_features = { "calt=1", "clig=0", "liga=0" }
M.enable_tab_bar = true
M.use_fancy_tab_bar = false
M.tab_bar_at_bottom = true
M.cell_width = 0.90
M.font_size = 12.0
M.color_schemes = {
  ["My Gruvbox"] = gruvbox
}
M.color_scheme = "My Gruvbox"

M.default_prog = { "/bin/bash" }
M.window_padding = {
  top = 0,
  bottom = 0,
  left = 0,
  right = 0,
}

M.leader = keybinds.leader
M.keys = keybinds.keys
M.tab_max_width = 40
M.scrollback_lines = 3000

return M
