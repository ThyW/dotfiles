require("dressing").setup({
	input = {
		enabled = true,
		insert_only = false,
		default_prompt = "-> ",
		border = "rounded",
	},
	select = {
		backed = { "fzf" },
	},
	get_config = nil,
})
