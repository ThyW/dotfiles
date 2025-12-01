local M = {
	"norcalli/nvim-colorizer.lua",
}

M.config = function()
	local ok, colorizer = pcall(require, "colorizer")
	if not ok then
		vim.notify("Could not load plugin: " .. M[1])
		return
	end
	colorizer.setup({ "*" })
end

return M
