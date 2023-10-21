local treesitter = require("plugins.nvim-treesitter")

return {
	-- Funcitons you don't want to write twice!
	"nvim-lua/plenary.nvim",
	-- vim.input UI wrapper
	"stevearc/dressing.nvim",

	--[[ Rust Porgramming language support for vim. Adds things
    -- such as :Cbuild, and :RustFmt and many others. ]]
	{ "rust-lang/rust.vim", ft = "rust" },

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

	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {
			--Config goes here
		},
	},

	--[[ File explorer for Neovim writtten in Lua.]]
	--[[ {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("plugins.nvim-tree")
    end
  }, ]]

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
	--[[ Tabnine AI completion for the `cmp` completion framework.]]
	-- removed for now due to not being used
	"saadparwaiz1/cmp_luasnip",
	--[[ Vscode-like pictograms for the completion windows.]]
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

	--[[ Fastest way to move through files with Noevim. Intuitive and simple to
    use.]]
	"ggandor/lightspeed.nvim",

	--[[ Create and manage floating terminals in Neovim.]]
	{
		"akinsho/toggleterm.nvim",
		branch = "main",
		lazy = false,
		config = function()
			require("plugins.toggleterm")
		end,
	},

	--[[ Preview for language server which support the lsp-progress
    specification.]]
	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		lazy = false,
		config = function()
			require("plugins.fidget")
		end,
	},

	--[[ Discrod Rich Presence for Neovim, written and configured using Lua.]]
	-- 'andweeb/presence.nvim'

	--[[ Syntax highlighting for the Nickel configuration language. ]]
	-- 'nickel-lang/vim-nickel'

	--[[Plugin for calling lazygit from within neovim]]
	{ "kdheepak/lazygit.nvim", lazy = false },

	--[[Yuck language support]]
	-- 'elkowar/yuck.vim'
	--[[Parentheses inferance for LISP languages]]
	{ "eraserhd/parinfer-rust", build = "cargo build --release" },

	--[[Autocompletion for adding rust crates into your Cargo.toml]]
	{
		"saecki/crates.nvim",
		tag = "v0.2.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
	--[[Completion source for writing latex symbols.]]
	"kdheepak/cmp-latex-symbols",
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
	{ "lvimuser/lsp-inlayhints.nvim", enabled = false },
	-- [[Signcolumn signs to provide git diagnostics.]]
	{
		"lewis6991/gitsigns.nvim",
		branch = "main",
		config = function()
			require("plugins.gitsigns")
		end,
	},
	-- [[Visual indentation lines.]]
	{ "lukas-reineke/indent-blankline.nvim", lazy = false },

	--[[Automatically create lists and indentation.]]
	{
		"gaoDean/autolist.nvim",
		config = function()
			require("autolist").setup({
				--[[ generic = {
                  enable_file_types = { "markdown", "text", "rmd" }
              } ]]
			})
		end,
	},
	--[[A plugin for taking scientific notes and pretty math equations.]]
	"jbyuki/nabla.nvim",

	--[[Amazing tools which assist one with writing Haskell]]
	{
		"MrcJkb/haskell-tools.nvim",
		branch = "1.x.x",
		config = function()
			require("plugins.haskell-tools")
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
	{
		"JellyApple102/flote.nvim",
		config = function()
			require("flote").setup({})
		end,
	},
	{ "freitass/todo.txt-vim" },
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},
	{
		"chipsenkbeil/distant.nvim",
		branch = "v0.3",
		config = function()
			require("distant"):setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("plugins.conform")
		end,
	},
}
