local keys = {
	{
		"s",
		mode = { "n", "x", "o" },
		function()
			require("flash").jump()
		end,
		desc = "Flash",
	},
	{
		"<c-s>",
		mode = { "c" },
		function()
			require("flash").toggle()
		end,
		desc = "Toggle Flash Search",
	},
}

local M = {
	src = "folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		for _, key in ipairs(keys) do
			local opt = {}
			if key.desc then
				opt = { desc = key.desc }
			end
			vim.keymap.set("n", key[1], key[2], opt)
		end
		require("flash").setup({})
	end,
}

return M
