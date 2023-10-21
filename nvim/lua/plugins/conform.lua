local conform = require("conform")

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
end, nil)
