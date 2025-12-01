local M = {
	"johnfrankmorgan/whitespace.nvim",
	config = function()
		local ok, whitespace = pcall(require, "whitespace-nvim")
		if not ok then
			vim.notify("Could not load plugin: " .. M[1], vim.log.levels.ERROR)
			return
		end
		whitespace.setup({
			-- configuration options and their defaults

			-- `highlight` configures which highlight is used to display
			-- trailing whitespace
			highlight = "DiffDelete",

			-- `ignored_filetypes` configures which filetypes to ignore when
			-- displaying trailing whitespace
			ignored_filetypes = { "TelescopePrompt", "Trouble", "help", "dashboard" },

			-- `ignore_terminal` configures whether to ignore terminal buffers
			ignore_terminal = true,

			-- `return_cursor` configures if cursor should return to previous
			-- position after trimming whitespace
			return_cursor = true,
		})

		-- remove trailing whitespace with a keybinding
		vim.keymap.set(
			"n",
			"<leader>t",
			whitespace.trim,
			{ silent = true, noremap = true, desc = "Trim trailing whitespaces" }
		)
	end,
}

return M
