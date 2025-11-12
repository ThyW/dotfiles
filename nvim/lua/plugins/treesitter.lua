local M = {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
	},
	lazy = false,
	build = ":TSUpdate",
}

M.config = function()
	require("nvim-treesitter").setup({
		install_dir = vim.fn.stdpath("data") .. "/site",
	})

	require("nvim-treesitter").install({
		"rust",
		"c",
		"cpp",
		"python",
		"php",
		"css",
		"html",
		"norg",
		"norg_meta",
		"norg_table",
		"bash",
		"lua",
		"vim",
		"haskell",
		"just",
		"java",
		"zig",
		"javascript",
		"typescript",
		"json",
		"yaml",
		"html",
		"latex",
	})

	vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

	require("nvim-treesitter-textobjects").setup({
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v",
			["@function.outer"] = "V",
			["@class.outer"] = "C-v",
		},
	})

	-- nvim-treesitter-textobjects

	vim.keymap.set({ "x", "o" }, "af", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "if", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "ac", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "ic", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
	end)
	-- You can also use captures from other query groups like `locals.scm`
	vim.keymap.set({ "x", "o" }, "as", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
	end)

	vim.keymap.set("n", "<leader>a", function()
		require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
	end)
	vim.keymap.set("n", "<leader>A", function()
		require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
	end)

	vim.keymap.set({ "n", "x", "o" }, "]m", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]]", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
	end)
	-- You can also pass a list to group multiple queries.
	vim.keymap.set({ "n", "x", "o" }, "]o", function()
		move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
	end)
	-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
	vim.keymap.set({ "n", "x", "o" }, "]s", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]z", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
	end)

	vim.keymap.set({ "n", "x", "o" }, "]M", function()
		require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "][", function()
		require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
	end)

	vim.keymap.set({ "n", "x", "o" }, "[m", function()
		require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[[", function()
		require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
	end)

	vim.keymap.set({ "n", "x", "o" }, "[M", function()
		require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[]", function()
		require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
	end)

	-- Go to either the start or the end, whichever is closer.
	-- Use if you want more granular movements
	vim.keymap.set({ "n", "x", "o" }, "]d", function()
		require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[d", function()
		require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
	end)

	local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
	vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
	vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
	vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
	vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
	vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
	vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
end

return M
