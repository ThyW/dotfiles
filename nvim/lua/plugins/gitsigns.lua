local M = {
	"lewis6991/gitsigns.nvim",
	branch = "main",
}

M.config = function()
	local gitsigns = require("gitsigns")

	gitsigns.setup({
		on_attach = function(bn)
			local map = function(m, l, h, opts)
				opts = opts or {}
				opts.buffer = bn
				vim.keymap.set(m, l, h, opts)
			end

			map("n", "<leader>hs", gitsigns.stage_hunk)
			map("n", "<leader>hr", gitsigns.reset_hunk)
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("n", "<leader>hS", gitsigns.stage_buffer)
			map("n", "<leader>hu", gitsigns.undo_stage_hunk)
			map("n", "<leader>hR", gitsigns.reset_buffer)
			map("n", "<leader>hp", gitsigns.preview_hunk)
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end)
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			map("n", "<leader>hd", gitsigns.diffthis)
			map("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end)
			map("n", "<leader>td", gitsigns.toggle_deleted)

			-- Text object
			map({ "o", "x" }, "<leader>ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	})
end

return M
