local M = {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
	require("oil").setup()

	vim.keymap.set("n", "<leader>of", ":Oil<CR>", { desc = "Open Oil" })
end

return M
