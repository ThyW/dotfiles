vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function (use)
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use 'stevearc/dressing.nvim'

    use 'rust-lang/rust.vim'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    use 'tpope/vim-surround'

    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'

    use 'neovim/nvim-lspconfig'

    use 'nvim-lua/lsp_extensions.nvim'

    use 'vim-pandoc/vim-rmarkdown'
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'

    use 'simrat39/rust-tools.nvim'

    use 'windwp/nvim-autopairs'

    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    use 'folke/lua-dev.nvim'

    use 'b3nj5m1n/kommentary'

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'saadparwaiz1/cmp_luasnip'

    use "onsails/lspkind-nvim"

    use "akinsho/bufferline.nvim"

    use "nvim-neorg/neorg"

    use {"TimUntersberger/neogit", requires = 'nvim-lua/plenary.nvim'}
    use 'ggandor/lightspeed.nvim'

    use 'akinsho/toggleterm.nvim'

    use 'j-hui/fidget.nvim'
end)