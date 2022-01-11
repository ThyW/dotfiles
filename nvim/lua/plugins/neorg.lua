require"neorg".setup{
    load = {
	["core.defaults"] = {},
	["core.keybinds"] = {
	    config = {
	    	default_keybinds = true,
	    	neorg_leader = "<Leader>i"
	    }
	},
	["core.norg.completion"] = {
	    config = {
		engine = "nvim-cmp"
	    }
	},
	["core.norg.concealer"] = {},
	["core.norg.dirman"] = {
	    config = {
	    	workspaces = {
	    	    my_workspace = "~/neorg",
	    	    dashboard = "~/dashboard"
		}
	    }
	},
	["core.gtd.base"] = {
	    config = {
	    	workspace = "dashboard",
	    	default_lists = {
	    	    inbox = "inbox.norg",
	    	},
	    	syntax = {
		    context = "#contexts",
		    start = "#time.start",
		    due = "#time.due",
		    waiting = "#waiting.for",
	    	}
	    }
	},
	["core.esupports"] = { },
	["core.esupports.hop"] = { },
    },
    --[[ logger = {
	-- Should print the output to neovim while running
	  use_console = true,

	  -- Should highlighting be used in console (using echohl)
	  highlights = true,

	  -- Should write to a file
	  use_file = false,

	  -- Any messages above this level will be logged.
	  level = "warn",

	  -- Level configuration
	  modes = {
		{ name = "trace", hl = "Comment", },
		{ name = "debug", hl = "Comment", },
		{ name = "info",  hl = "None", },
		{ name = "warn",  hl = "WarningMsg", },
		{ name = "error", hl = "ErrorMsg", },
		{ name = "fatal", hl = "ErrorMsg", },
	  },

	  -- Can limit the number of decimals displayed for floats
	  float_precision = 0.01,
    }, ]]
    requires = "nvim-lua/plenary.nvim"
}
