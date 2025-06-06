local M = {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
	require("oil").setup({
		-- This needs to be disabled when installing a new `spelllang`.
		--
		-- 1. change this to false, reload config and check that `netrw`
		--    loaded correctly.
		-- 2. open `nvim`; run `:setlocal spell spelllang=<abbreviate for the language>`
		-- 3. a prompt to install the language should appear, press `Y<CR>`
		-- 4. if no errors occurred, the language should be installed and ready to be used.
		default_file_explorer = true,
	})

	vim.keymap.set("n", "<leader>of", ":Oil<CR>", { desc = "Open Oil" })
end

return M
