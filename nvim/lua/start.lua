M = {}


M.load = function (first)
  require("autocmds")
  local err, _ = pcall(require, "plugins")
  if not err then
    print("failed to load plugins.")
  end
  local settings
  err,  settings = pcall(require, "settings")
  if not err then
    print("failed to load settings.")
  end
  settings.load(first)
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
end

M.reload = function ()
  package.loaded["lua.start"] = nil
  package.loaded["autocmds"] = nil
  package.loaded["settings"] = nil
  package.loaded["functions"] = nil
  package.loaded["keybinds"] = nil
  package.loaded["plugins"] = nil
  package.loaded["pluginconf"] = nil
  require("lua.start").load(false)
end

return M
