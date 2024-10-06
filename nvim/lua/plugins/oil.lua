local M = {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}

M.config = function()
	require("oil").setup()

	vim.keymap.set("n", "<leader>of", ":Oil<cr>")
end

return M