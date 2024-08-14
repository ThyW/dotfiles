local M = {
	"nvim-neorg/neorg",
	after = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim", "nvim-neorg/neorg-telescope" },
	lazy = false,
	version = "*",
}

M.config = function()
	require("neorg").setup({
		load = {
			["core.defaults"] = {},
			["core.keybinds"] = {
				config = {
					default_keybinds = true,
					neorg_leader = "<Leader>i",
					hook = function(keybinds)
						keybinds.map("norg", "n", "<leader>zn", "<cmd>Neorg zettel new<CR>")
						keybinds.map("norg", "n", "<leader>ze", "<cmd>Neorg zettel explore<CR>")
						keybinds.map("norg", "n", "<leader>zb", "<cmd>Neorg zettel backlinks float<CR>")
						keybinds.map(
							"norg",
							"n",
							"<leader>ce",
							"<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>"
						)
					end,
				},
			},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/notes",
					},
				},
			},
			-- indentation with TreeSitter support
			["core.esupports.indent"] = {},
			-- editing code blocks in different buffers
			["core.looking-glass"] = {},
			["core.integrations.telescope"] = {},
		},
		requires = "nvim-lua/plenary.nvim",
	})

	local neorg_callbacks = require("neorg.core.callbacks")

	neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
		-- Map all the below keybinds only when the "norg" mode is active
		keybinds.map_event_to_mode("norg", {
			n = { -- Bind keys in normal mode
				{ "<C-s>", "core.integrations.telescope.find_linkable" },
			},

			i = { -- Bind in insert mode
				{ "<C-l>", "core.integrations.telescope.insert_link" },
			},
		}, {
			silent = true,
			noremap = true,
		})
	end)
end

return M
