vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function ()
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

    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    use {'ms-jpq/coq.thirdparty', branch = '3p'}

    use 'simrat39/rust-tools.nvim'

    use 'windwp/nvim-autopairs'
    
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
end)
