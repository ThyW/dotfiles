local just = {
	install_info = {
		url = "https://github.com/IndianBoy42/tree-sitter-just",
		files = { "src/parser.c", "src/scanner.c" },
		branch = "main",
	},
	maintainsers = { "@IndianBoy42" },
}

local norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}

local norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main",
	},
}

local norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main",
	},
}

local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	build = ":TSUpdate",
}

M.config = function()
	local configs = require("nvim-treesitter.parsers")
	local parsers = configs.get_parser_configs()

	parsers.just = just
	parsers.norg = norg
	parsers.norg_meta = norg_meta
	parsers.norg_table = norg_table

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
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
			"latex",
			"bash",
			"lua",
			"vim",
			"haskell",
			"just",
			"java",
			"zig",
		},
		highlight = {
			enable = true,
		},
		autopairs = { enable = true },
		incremental_selection = {
			enable = true,
			kaymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		refactor = {
			highlight_definitions = {
				enable = true,
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>aa"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			lsp_interop = {
				enable = true,
				border = "none",
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
					["<leader>dF"] = "@class.outer",
				},
			},
		},
	})
end

return M
