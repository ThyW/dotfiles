local M = {
	"lewis6991/gitsigns.nvim",
	branch = "main",
	config = function()
		require("plugins.gitsigns")
	end,
}

M.config = function()
	local telescope_builtin = require("telescope.builtin")
	local gitsigns = require("gitsigns")

	gitsigns.setup({
		on_attach = function(bn)
			local lmap = function(m, l, h, opts)
				opts = opts or {}
				opts.buffer = bn
				vim.keymap.set(m, l, h, opts)
			end

			lmap("n", "gp", gitsigns.preview_hunk)
			lmap("n", "gS", gitsigns.stage_buffer)
			lmap("n", "gus", gitsigns.undo_stage_hunk)
			lmap("n", "gs", gitsigns.stage_hunk)
			lmap("n", "gr", gitsigns.reset_hunk)
			lmap("n", "gR", gitsigns.reset_buffer)
			lmap("n", "gb", gitsigns.blame_line)
			lmap("n", "gN", gitsigns.next_hunk)
			lmap("n", "gP", gitsigns.prev_hunk)
			lmap("n", "gll", function()
				gitsigns.setqflist("all", { open = false, use_location_list = true })
				telescope_builtin.loclist({})
			end)
		end,
	})
end

return M
