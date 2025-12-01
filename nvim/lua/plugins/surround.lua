local M = {
	"kylechui/nvim-surround",
}

M.config = function()
	local ok, surround = pcall(require, "nvim-surround")
	if not ok then
		vim.notify("Could not load plugin: " .. M[1], vim.log.levels.ERROR)
		return
	end
	surround.setup()
end

return M
