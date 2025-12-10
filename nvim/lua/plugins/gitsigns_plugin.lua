local M = {
	"lewis6991/gitsigns.nvim",
	branch = "main",
}

M.config = function()
	local ok, gitsigns = pcall(require, "gitsigns")
	if not ok then
		vim.notify("Could not load plugin: " .. M[1])
		return
	end

	gitsigns.setup({
		debug_mode = true,
		auto_attach = true,
		on_attach = function(buf)
			local map = function(m, l, r, desc)
				local opts = { silent = false, noremap = true, desc = desc, buffer = buf }
				vim.keymap.set(m, l, r, opts)
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
			map("n", "<leader>td", gitsigns.preview_hunk_inline, "Toggle deleted")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Inside hunk")

			-- fast moving between hunks
			map("n", "]h", function()
				gitsigns.nav_hunk("next")
			end, "Move to next hunk")
			map("n", "[h", function()
				gitsigns.nav_hunk("prev")
			end, "Move to previous hunk")
			map("n", "]H", function()
				gitsigns.nav_hunk("last")
			end, "Move to next hunk")
			map("n", "[H", function()
				gitsigns.nav_hunk("first")
			end, "Move to previous hunk")
		end,
	})
end

return M
