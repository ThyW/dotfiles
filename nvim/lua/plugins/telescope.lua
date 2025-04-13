local M = {
	"nvim-telescope/telescope.nvim",
	config = function()
		require("plugins.telescope")
	end,
	-- dependencies = { {"nvim-telescope/telescope-fzf-native.nvim", build = "make"} },
	dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
}

M.config = function()
	local telescope = require("telescope")
	telescope.setup({
		pickers = {
			find_files = {
				theme = "dropdown",
			},
			current_buffer_fuzzy_find = {
				theme = "dropdown",
			},
			buffers = {
				theme = "dropdown",
			},
			git_files = {
				theme = "dropdown",
			},
			command_history = {
				theme = "ivy",
			},
			quickfix = {
				theme = "dropdown",
			},
			spell_suggest = {
				theme = "cursor",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})

	telescope.load_extension("fzf")
	local keymap = vim.keymap.set
	local set = function(keys, action, desc)
		keymap("n", keys, action, { silent = true, desc = desc })
	end

	-- Keybinds
	set("<leader>ff", function()
		require("telescope.builtin").find_files()
	end, "TScope files")
	set("<leader>fl", function()
		require("telescope.builtin").current_buffer_fuzzy_find()
	end, "TScope fuzzy find")
	set("<leader>fb", function()
		require("telescope.builtin").buffers()
	end, "TScope buffers")
	set("<leader>fg", function()
		require("telescope.builtin").git_files()
	end, "TScope git files")
	set("<leader>fh", function()
		require("telescope.builtin").command_history()
	end, "TScope command history")
	set("<leader>fq", function()
		require("..core.lib.diagnostics").quickfix_list(false)
		require("telescope.builtin").quickfix()
	end, "TScope quickfix")
	set("<leader>ft", function()
		require("telescope.builtin").treesitter()
	end, "TScope treesitter")
	set("<leader>fp", function()
		require("telescope.builtin").builtin()
	end, "TScope telescope pickers")
	set("<leader>fL", function()
		require("telescope.builtin").live_grep()
	end, "TScope live grep")
	set("<leader>f=", function()
		require("telescope.builtin").spell_suggest()
	end, "TScope spell suggest")
	set("<leader>fd", function()
		require("telescope.builtin").diagnostics()
	end, "TScope diagnostics")
end

return M
