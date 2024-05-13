local M = {
	"nvim-neorg/neorg",
	after = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
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
						keybinds.map("norg", "n", "<leader>zn", "<cmd>Neorg zettel new")
						keybinds.map("norg", "n", "<leader>ze", "<cmd>Neorg zettel explore")
						keybinds.map("norg", "n", "<leader>zb", "<cmd>Neorg zettel backlinks float")
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
		},
		requires = "nvim-lua/plenary.nvim",
	})
end

return M
