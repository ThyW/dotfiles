local module = {
	src = "windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function ()
		require("nvim-autopairs").setup()
	end,
}

return module
