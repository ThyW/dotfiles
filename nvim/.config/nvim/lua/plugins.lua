vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function (use)
    use 'wbthomason/packer.nvim'

    use 'rust-lang/rust.vim'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'morhetz/gruvbox'

    use 'tpope/vim-surround'

    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

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

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'saadparwaiz1/cmp_luasnip'

    use "onsails/lspkind-nvim"

    use "akinsho/bufferline.nvim"
end)
