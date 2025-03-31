local M = {
	"lewis6991/gitsigns.nvim",
	branch = "main",
}

M.config = function()
	local gitsigns = require("gitsigns")

	gitsigns.setup({
		on_attach = function(bn)
			local map = function(m, l, h, desc)
				local opts = { silent = "true", noremap = "true", desc }
				opts.buffer = bn
				vim.keymap.set(m, l, h, opts)
			end

			map("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk")
			map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage selected hunk(s)")
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset selected hunk(s)")
			map("n", "<leader>gS", gitsigns.stage_buffer, "Stage buffer")
			map("n", "<leader>gu", gitsigns.undo_stage_hunk, "Undo stage hunk")
			map("n", "<leader>gR", gitsigns.reset_buffer, "Reset buffer")
			map("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk")
			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle line blame")
			map("n", "<leader>gd", gitsigns.diffthis, "Diff this")
			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, "Special diff this")
			map("n", "<leader>td", gitsigns.toggle_deleted, "Toggle deleted")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Inside hunk")
		end,
	})
end

return M
