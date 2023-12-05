local treesitter = require("plugins.nvim-treesitter")

return {
	-- Funcitons you don't want to write twice!
	"nvim-lua/plenary.nvim",
	-- vim.input UI wrapper
	"stevearc/dressing.nvim",
	--[[ Lua fuzzy finder with great overall integration]]
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.telescope")
		end,
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	--[[ Gruvbox colorscheme for nvim, written in Lua.]]
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			require("gruvbox").setup({
				overrides = {
					TSKeyword = {
						italic = true,
						bold = true,
						fg = "#fb4934",
					},
					TSKeywordFunction = {
						italic = true,
						bold = true,
						fg = "#fb4934",
					},
					TSRepeat = {
						italic = true,
						bold = true,
						fg = "#fb4934",
					},
					TSConditional = {
						italic = true,
						bold = true,
						fg = "#fb4934",
					},
				},
			})

			vim.opt.background = "dark"
			vim.cmd("colorscheme gruvbox")

			local highlights = {
				"highlight SignColumn guibg=none",
				"highlight LineNr ctermfg=240",
				"highlight CursorLineNr cterm=bold gui=bold guibg=none",
				"highlight Pmenu ctermfg=red ctermbg=red " .. "cterm=bold guifg=#fabd2f " .. "guibg=#292929",
				"highlight SpellBad guifg=red guibg=black gui=underline ",
				"highlight StatusLine ctermfg=black " .. "ctermbg=gray guibg=#efc169 " .. "guifg=#504945",
				"highlight StatusLineNC guibg=#efc169 guifg=#3c3836",
				"highlight ColorColumn ctermbg=none",
				"highlight Conceal ctermbg=none",
				"highlight LspDiagnosticsError ctermfg=red",
				"highlight LspDiagnosticsWarning ctermfg=cyan",
				"highlight LspDiagnosticsInformation ctermfg=grey",
			}

			for _, v in ipairs(highlights) do
				vim.cmd(v)
			end
		end,
	},

	--[[ Surround parts of text with quotes, brackets and more!]]
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	--[[ Syntax highligting. Tree-sitter is a great parsing library for parsing
    languages and great syntax highlighting.]]
	treesitter,

	--[[ Togglelabe comments for different programming languages.]]
	{ "b3nj5m1n/kommentary", lazy = false },

	--[[ Snippet engine and snippets for the `cmp` completion plugin.]]
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		branch = "master",
		lazy = false,
		config = function()
			local ls = require("luasnip")
			local s = ls.parser.parse_snippet

			ls.filetype_extend("markdown", { "tex" })
			ls.filetype_extend("rmarkdown", { "tex" })

			ls.add_snippets("all", { s("shbang", "#!/usr/bin/env $0") }, {})
			ls.add_snippets("rust", {
				s("ils", "if let Some($1) = $2 {\n    $3\n}"),
				s("pdbg", '#[cfg(debug_assertions)]\nprintln!("$1");'),
			}, {})
		end,
	},

	--[[ Completion framework written in Lua for Neovim.]]
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp")
		end,
		lazy = false,
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"onsails/lspkind-nvim",

	--[[ Better way to show buffers and be able to click them and switch to
    them.]]
	{
		"akinsho/bufferline.nvim",
		branch = "main",
		config = function()
			require("plugins.bufferline")
		end,
	},

	--[[ Neorg a new org-mode like document editing, writing and organising
    mode for Noevim written in Lua.]]
	{
		"nvim-neorg/neorg",
		branch = "main",
		config = function()
			require("plugins.neorg")
		end,
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	--[[ Preview for language server which support the lsp-progress
    specification.]]
	{
		"j-hui/fidget.nvim",
		lazy = false,
		config = function()
			require("fidget").setup({})
		end,
	},

	--[[Plugin for calling lazygit from within neovim]]
	{ "kdheepak/lazygit.nvim", lazy = false },

	--[[Highlight background colors.]]
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
		lazy = false,
	},

	-- [[Distractionless writing.]]
	{ "folke/zen-mode.nvim", enabled = false },

	-- [[Signcolumn signs to provide git diagnostics.]]
	{
		"lewis6991/gitsigns.nvim",
		branch = "main",
		config = function()
			require("plugins.gitsigns")
		end,
	},

	--[[Automatically create lists and indentation.]]
	{
		"gaoDean/autolist.nvim",
		ft = {
			"markdown",
			"text",
			"tex",
			"plaintex",
			"norg",
		},
		config = function()
			require("autolist").setup()
		end,
	},

	--[[Plugin which makes managing external tools like language servers,
    -- linters and formatters easy and simple.]]
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.mason")
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"neovim/nvim-lspconfig",
			"nvim-lua/lsp_extensions.nvim",
		},
	},
	--[[Better interop with Java  language server.]]
	{ "mfussenegger/nvim-jdtls" },
	--[[formatter]]
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("plugins.conform")
		end,
	},
	--[[Status bar library]]
	{
		"MunifTanjim/nougat.nvim",
		config = function()
			require("plugins.nougat")
		end,
	},
}
