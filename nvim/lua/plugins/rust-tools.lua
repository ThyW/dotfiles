require('rust-tools').setup {
    tools = { -- rust-tools options
    autoSetHints = true,
    hover_with_actions = true,
    runnables = {
	use_telescope = false -- don't have telescope
    },

    debuggables = {
	use_telescope = false -- don't have telescope
    },

    inlay_hints = {
	only_current_line = true,
	only_current_line_autocmd = "CursorHold",
	show_parameter_hints = true,
	parameter_hints_prefix = "<- ",
	other_hints_prefix = "=> ",
	max_len_align = false,
	max_len_align_padding = 1,
	right_align = false,
	right_align_padding = 7,
	highlight = "Comment",
    },

    hover_actions = {
	border = {
	    {"╭", "FloatBorder"}, {"─", "FloatBorder"},
	    {"╮", "FloatBorder"}, {"│", "FloatBorder"},
	    {"╯", "FloatBorder"}, {"─", "FloatBorder"},
	    {"╰", "FloatBorder"}, {"│", "FloatBorder"}
	},
	auto_focus = false
    },
    crate_graph = {
	backend = "x11",
	output = nil,
	full = true,
    }
},
server = {} -- rust-analyer options
}