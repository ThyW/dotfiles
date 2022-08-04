vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Lua package manager for neovim plugins
  use 'wbthomason/packer.nvim'
  -- Funcitons you don't want to write twice!
  use "nvim-lua/plenary.nvim"
  -- vim.input UI wrapper
  use 'stevearc/dressing.nvim'

  --[[ Rust Porgramming language support for vim. Adds things such as :Cbuild, and
    :RustFmt and many others. ]]
  use 'rust-lang/rust.vim'

  --[[ Fuzzy finder and vim integration]]
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  --[[ Lua fuzzy finder with great overall integration]]
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  --[[ Gruvbox colorscheme for nvim, written in Lua.]]
  use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }

  --[[ Surround parts of text with quotes, brackets and more!]]
  use 'tpope/vim-surround'

  --[[ Syntax highligting. Tree-sitter is a great parsing library for parsing
    languages and great syntax highlighting.]]
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  --[[ Configuration for Neovim LSP]]
  use 'neovim/nvim-lspconfig'

  --[[ Neovim LSP extensions and helpers such as Inlay Hints and diagnostics.
    ]]
  use 'nvim-lua/lsp_extensions.nvim'

  --[[ Rmarkdown, pandoc, latex and markdown and other note taking utilities.
    ]]
  use 'vim-pandoc/vim-rmarkdown'
  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-pandoc-syntax'

  --[[ More tools, helpers and extensions for writing Rust in Neovim.]]
  -- I stopped using this, because it didn't really achieve what I was looking for
  -- my configuration can still be found in lua/plugins/rust-tools.lua
  -- use 'simrat39/rust-tools.nvim'

  --[[ Automatically create and complete brackets, quotes and more.]]
  use 'windwp/nvim-autopairs'

  --[[ File explorer for Neovim writtten in Lua.]]
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  --[[ Setup development environment for writing Neovim Lua plugins.]]
  use 'folke/lua-dev.nvim'

  --[[ Togglelabe comments for different programming languages.]]
  use 'b3nj5m1n/kommentary'

  --[[ Snippet engine and snippets for the `cmp` completion plugin.]]
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  --[[ Completion framework written in Lua for Neovim.]]
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-cmdline'
  --[[ Tabnine AI completion for the `cmp` completion framework.]]
  -- removed for now due to not being used
  -- use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'saadparwaiz1/cmp_luasnip'
  --[[ Vscode-like pictograms for the completion windows.]]
  use "onsails/lspkind-nvim"

  --[[ Better way to show buffers and be able to click them and switch to
    them.]]
  use { "akinsho/bufferline.nvim", branch = "main" }

  --[[ Neorg a new org-mode like document editing, writing and organising
    mode for Noevim written in Lua.]]
  use { "nvim-neorg/neorg", branch = "main" }

  --[[ Fastest way to move through files with Noevim. Intuitive and simple to
    use.]]
  use 'ggandor/lightspeed.nvim'

  --[[ Create and manage floating terminals in Neovim.]]
  use { 'akinsho/toggleterm.nvim', branch = "main" }

  --[[ Preview for language server which support the lsp-progress
    specification.]]
  use 'j-hui/fidget.nvim'

  --[[ Discrod Rich Presence for Neovim, written and configured using Lua.]]
  use 'andweeb/presence.nvim'

  --[[ Syntax highlighting for the Nickel configuration language. ]]
  use 'nickel-lang/vim-nickel'

  --[[Plugin for calling lazygit from within neovim]]
  use 'kdheepak/lazygit.nvim'

  --[[Yuck language support]]
  use 'elkowar/yuck.vim'
  --[[Parentheses inferance for LISP languages]]
  use { 'eraserhd/parinfer-rust', run = 'cargo build --release' }

  --[[Autocompletion for adding rust crates into your Cargo.toml]]
  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }
  --[[Completion source for writing latex symbols.]]
  use 'kdheepak/cmp-latex-symbols'
  --[[Highlight background colors.]]
  use { 'norcalli/nvim-colorizer.lua', config = {
    require("colorizer").setup({
      "*",
    })
  } }
  use { 'folke/zen-mode.nvim' }
  use { 'simrat39/inlay-hints.nvim' }
end)
