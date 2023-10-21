local bi = require("telescope.builtin")
local gs = require("gitsigns")

gs.setup({
	on_attach = function(bn)
		local lmap = function(m, l, h, opts)
			opts = opts or {}
			opts.buffer = bn
			vim.keymap.set(m, l, h, opts)
		end

		lmap("n", "gp", gs.preview_hunk)
		lmap("n", "gS", gs.stage_buffer)
		lmap("n", "gus", gs.undo_stage_hunk)
		lmap("n", "gs", gs.stage_hunk)
		lmap("n", "gr", gs.reset_hunk)
		lmap("n", "gR", gs.reset_buffer)
		lmap("n", "gb", gs.blame_line)
		lmap("n", "gN", gs.next_hunk)
		lmap("n", "gP", gs.prev_hunk)
		lmap("n", "gll", function()
			gs.setqflist("all", { open = false, use_location_list = true })
			bi.loclist({})
		end)
	end,
})
