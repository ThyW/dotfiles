require("telescope").setup{
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

-- Keybinds
vim.api.nvim_exec([[
noremap <silent> <leader>ff <cmd>lua require("telescope.builtin").find_files()<CR>
noremap <silent> <leader>fl <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>
noremap <silent> <leader>fb <cmd>lua require("telescope.builtin").buffers()<CR>
noremap <silent> <leader>fg <cmd>lua require("telescope.builtin").git_files()<CR>

noremap <silent> <leader>fh <cmd>lua require("telescope.builtin").command_history()<CR>
noremap <silent> <leader>fq <cmd>lua require("telescope.builtin").quickfix()<CR>

noremap <silent> <leader>ft <cmd>lua require("telescope.builtin").treesitter({bufnr = 0})<CR>
]], false)
