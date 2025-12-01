local M = {
	"stevearc/conform.nvim",
	opts = {},
}

M.config = function()
	local ok, conform = pcall(require, "conform")
	if not ok then
		vim.notify("Could not load plugin: " .. M[1], vim.log.levels.ERROR)
		return
	end

	local format_opts = {
		lsp_fallback = true,
		timeout_ms = 500,
		async = false,
	}

	conform.setup({
		formatters_by_ft = {
			python = { "black" },
			c = { "clang-format" },
			haskell = { "hindent" },
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
		format_on_save = format_opts,
	})

	vim.keymap.set({ "n", "v" }, "<leader>af", function()
		conform.format(format_opts)
	end, { desc = "Format buffer", silent = false })
end

return M
