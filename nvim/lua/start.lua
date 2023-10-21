M = {}

M.load = function()
	local err = false
	require("autocmds")
	require("lazy-plugin")
	err, _ = pcall(require, "settings")
	if not err then
		print("failed to load settings.")
	end
	err, _ = pcall(require, "functions")
	if not err then
		print("failed to load user defined functions.")
	end
	err, _ = pcall(require, "keybinds")
	if not err then
		print("failed to load user defined keybindings.")
	end
end

return M
