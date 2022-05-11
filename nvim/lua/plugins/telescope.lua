require("telescope").setup {
	pickers = {
		find_files = {
			theme = "dropdown"
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown"
		},
		buffers = {
			theme = "dropdown"
		},
		git_files = {
			theme = "dropdown"
		},
		command_history = {
			theme = "ivy"
		},
		quickfix = {
			theme = "dropdown"
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
}

require("telescope").load_extension("fzf")
local keymap = vim.keymap.set
local set = function(keys, action)
	keymap("n", keys, action)
end

-- Keybinds
set("<leader>ff", function() require("telescope.builtin").find_files() end)
set("<leader>fl", function() require("telescope.builtin").current_buffer_fuzzy_find() end)
set("<leader>fb", function() require("telescope.builtin").buffers() end)
set("<leader>fg", function() require("telescope.builtin").git_files() end)
set("<leader>fh", function() require("telescope.builtin").command_history() end)
set("<leader>fq", function()
    require("diagnostics").quickfix_list(false)
    require("telescope.builtin").quickfix()
end)
set("<leader>ft", function() require("telescope.builtin").treesitter() end)
set("<leader>fp", function() require("telescope.builtin").builtin() end)
