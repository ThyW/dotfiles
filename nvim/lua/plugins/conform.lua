local M = {
	src = "stevearc/conform.nvim",
}

M.config = function()
	local ok, conform = pcall(require, "conform")
	if not ok then
		vim.notify("Could not load plugin: " .. M[1], vim.log.levels.ERROR)
		return
	end

	local format_opts = {
		timeout_ms = 1000,
		lsp_fallback = true,
	}

	conform.setup({
		formatters_by_ft = {
			python = { "black" },
			c = { "clang-format" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			markdown = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			yaml = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
		},
		-- format_on_save = format_opts,
		format_after_save = {
			lsp_fallback = true,
		},
	})

	vim.keymap.set({ "n", "v" }, "<leader>af", function()
		conform.format(format_opts)
	end, { desc = "Format buffer", silent = false })
end

return M
