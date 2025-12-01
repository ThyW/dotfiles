local M = {
	"akinsho/bufferline.nvim",
	branch = "main",
}

M.config = function()
	local ok, bufferline = pcall(require, "bufferline")
	if not ok then
		vim.notify("Could not load plugin: " .. M[1])
		return
	end

	bufferline.setup({
		options = {
			numbers = "buffer_id",
			close_command = "bdelete! %d",
			left_mouse_command = "buffer %d",
			diagnostics = "nvim_lsp",
			show_buffer_icons = true,
			always_show_bufferline = true,
			separator_style = "thin",
		},
	})
end

return M
