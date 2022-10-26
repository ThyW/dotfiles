-- trying this to skip some startup errors
vim.opt.termguicolors = true

require("autocmds")
local err, _ = pcall(require, "plugins")
if not err then
  print("failed to load plugins.")
end
err, _ = pcall(require, "settings")
if not err then
  print("failed to load settings.")
end
err, _ = pcall(require, "functions")
if not err then
  print("failed to load user defined functions.")
end
err, _ = pcall(require, "pluginconf")
if not err then
  print("failed to load plugin configurations.")
end
err, _ = pcall(require, "keybinds")
if not err then
  print("failed to load user defined keybindings.")
end
