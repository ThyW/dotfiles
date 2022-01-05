require('dressing').setup({
    input = {
	insert_only = false,
	default_prompt = "-> ",
	border = "rounded"
    },
    select = {
    	backed = {"fzf"}
    },
    get_config = nil
})
