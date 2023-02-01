local treesitter = require("plugins.nvim-treesitter")

return {
  -- Funcitons you don't want to write twice!
  "nvim-lua/plenary.nvim",
  -- vim.input UI wrapper
  'stevearc/dressing.nvim',

  --[[ Rust Porgramming language support for vim. Adds things such as :Cbuild, and
    :RustFmt and many others. ]]
  { 'rust-lang/rust.vim', ft = "rust" },

  --[[ Fuzzy finder and vim integration]]
  --[[ 'junegunn/fzf'
  'junegunn/fzf.vim' ]]

  --[[ Lua fuzzy finder with great overall integration]]
  {'nvim-telescope/telescope.nvim', config = function ()
      require('plugins.telescope')
    end,
    dependencies = {'nvim-telescope/telescope-fzf-native.nvim'}},
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  --[[ Gruvbox colorscheme for nvim, written in Lua.]]
  { "ellisonleao/gruvbox.nvim", dependencies = { "rktjmp/lush.nvim" }, lazy = false },

  --[[ Surround parts of text with quotes, brackets and more!]]
  { 'kylechui/nvim-surround', config = function()
    require("nvim-surround").setup()
  end },

  --[[ Syntax highligting. Tree-sitter is a great parsing library for parsing
    languages and great syntax highlighting.]]
  treesitter,

  --[[ Configuration for Neovim LSP]]
  { 'neovim/nvim-lspconfig', config = function()
    require("plugins.lsp")
  end,
    dependencies = { 'nvim-lua/lsp_extensions.nvim' } },

  --[[ Neovim LSP extensions and helpers such as Inlay Hints and diagnostics.
    ]]
  --[[ Rmarkdown, pandoc, latex and markdown and other note taking utilities.
    ]]
  -- disabled for now, it was really intrusive and wasn't doing what it expected it to do.
  --[[ 'vim-pandoc/vim-rmarkdown'
  'vim-pandoc/vim-pandoc'
  'vim-pandoc/vim-pandoc-syntax' ]]

  --[[ More tools, helpers and extensions for writing Rust in Neovim.]]
  -- I stopped using this, becait didn't really achieve what I was looking for
  -- my configuration can still be found in lua/plugins/rust-tools.lua
  -- 'simrat39/rust-tools.nvim'

  --[[ Automatically create and complete brackets, quotes and more.]]
  { 'windwp/nvim-autopairs',
    branch = "master",
    lazy = false,
    config = function()
      require 'nvim-autopairs'.setup {
        check_ts = true,
      }
    end },

  --[[ File explorer for Neovim writtten in Lua.]]
  { 'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    lazy = false,
    config = function ()
      require("plugins.nvim-tree")
    end
  },

  --[[ Setup development environment for writing Neovim Lua plugins.]]
  -- 'folke/lua-dev.nvim'

  --[[ Togglelabe comments for different programming languages.]]
  { 'b3nj5m1n/kommentary', lazy = false },

  --[[ Snippet engine and snippets for the `cmp` completion plugin.]]
  { "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    branch = 'master',
    lazy = false,
    config = function()
      local ls = require("luasnip")
      local s = ls.parser.parse_snippet

      ls.filetype_extend("markdown", { "tex" })
      ls.filetype_extend("rmarkdown", { "tex" })

      ls.add_snippets("all", { s("shbang", "#!/usr/bin/env $0") }, {})
      ls.add_snippets("rust",
        { s("ils", "if let Some($1) = $2 {\n    $3\n}"), s("pdbg", "#[cfg(debug_assertions)]\nprintln!(\"$1\");") }, {})
    end

  },

  --[[ Completion framework written in Lua for Neovim.]]
  { 'hrsh7th/nvim-cmp',
    config = function()
      require("plugins.cmp")
    end,
    lazy = false },
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-cmdline',
  --[[ Tabnine AI completion for the `cmp` completion framework.]]
  -- removed for now due to not being used
  -- {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'}
  'saadparwaiz1/cmp_luasnip',
  --[[ Vscode-like pictograms for the completion windows.]]
  "onsails/lspkind-nvim",

  --[[ Better way to show buffers and be able to click them and switch to
    them.]]
  { "akinsho/bufferline.nvim",
    branch = "main",
    lazy = false,
    config = function()
      require("plugins.bufferline")
    end
  },

  --[[ Neorg a new org-mode like document editing, writing and organising
    mode for Noevim written in Lua.]]
  -- { "nvim-neorg/neorg", branch = "main" }

  --[[ Fastest way to move through files with Noevim. Intuitive and simple to
    use.]]
  'ggandor/lightspeed.nvim',

  --[[ Create and manage floating terminals in Neovim.]]
  { 'akinsho/toggleterm.nvim',
    branch = "main",
    lazy = false,
    config = function()
      require("plugins.toggleterm")
    end
  },

  --[[ Preview for language server which support the lsp-progress
    specification.]]
  { 'j-hui/fidget.nvim',
    lazy = false,
    config = function()
      require("plugins.fidget")
    end
  },

  --[[ Discrod Rich Presence for Neovim, written and configured using Lua.]]
  -- 'andweeb/presence.nvim'

  --[[ Syntax highlighting for the Nickel configuration language. ]]
  -- 'nickel-lang/vim-nickel'

  --[[Plugin for calling lazygit from within neovim]]
  { 'kdheepak/lazygit.nvim', lazy = false },

  --[[Yuck language support]]
  -- 'elkowar/yuck.vim'
  --[[Parentheses inferance for LISP languages]]
  { 'eraserhd/parinfer-rust', build = 'cargo build --release' },

  --[[Autocompletion for adding rust crates into your Cargo.toml]]
  {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("crates").setup()
    end
  },
  --[[Completion source for writing latex symbols.]]
  'kdheepak/cmp-latex-symbols',
  --[[Highlight background colors.]]
  { 'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup({ "*" })
    end,
    lazy = false
  },
  -- [[Distractionless writing.]]
  { 'folke/zen-mode.nvim', enabled = false },
  -- [[Standalone package to provide inlay hint virtual text, currently unused.]]
  -- { 'simrat39/inlay-hints.nvim' }
  { 'lvimuser/lsp-inlayhints.nvim', enabled = false },
  -- [[Gruvbox colorschemes.]]
  --[[ { 'luisiacc/gruvbox-baby', branch = 'main' }
  { "sainnhe/gruvbox-material" } ]]
  -- [[Signcolumn signs to provide git diagnostics.]]
  { 'lewis6991/gitsigns.nvim', branch = 'main' },
  -- [[Visual indentation lines.]]
  { 'lukas-reineke/indent-blankline.nvim', lazy = false },

  -- [[Language support for the Odin language.]]
  -- { 'Tetralux/odin.vim', branch = 'master' }

  --[[Automatically create lists and indentation.]]
  { 'gaoDean/autolist.nvim',
    config = function()
      require("autolist").setup({
        generic = {
          enable_file_types = { "markdown", "text", "rmd" }
        }
      })
    end
  },
  --[[Nice interface for todo.txt]]
  -- { 'arnarg/todotxt.nvim', requires = { 'MunifTanjim/nui.nvim' } }
  -- { 'ThyW/todotxt.nvim', requires = { 'MunifTanjim/nui.nvim' }, branch = 'vim-ui-input' }

  --[[A plugin for taking scientific notes and pretty math equations.]]
  'jbyuki/nabla.nvim',

  --[[Amazing tools which assist one with writing Haskell]]
  { 'MrcJkb/haskell-tools.nvim', config = function()
    require("plugins.haskell-tools")
  end },

  --[[Plugin which makes managing external tools like language servers, linters and formatters easy and simple.]]
  { "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
    dependencies = { "williamboman/mason-lspconfig.nvim" }
  },
  --[[Easy nvim lspconfig interop.]]
}
