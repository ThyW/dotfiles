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

			map("n", "<leader>gs", gitsigns.stage_hunk)
			map("n", "<leader>gr", gitsigns.reset_hunk)
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("n", "<leader>gS", gitsigns.stage_buffer)
			map("n", "<leader>gu", gitsigns.undo_stage_hunk)
			map("n", "<leader>gR", gitsigns.reset_buffer)
			map("n", "<leader>gp", gitsigns.preview_hunk)
			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end)
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			map("n", "<leader>gd", gitsigns.diffthis)
			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end)
			map("n", "<leader>td", gitsigns.toggle_deleted)

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	})
end

return M
