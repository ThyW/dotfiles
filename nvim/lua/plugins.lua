vim.o.rtp = "~/.config/nvim/bundle/Vundle.vim"

vim.api.nvim_exec([[
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'hugolgst/vimsence'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'neoclide/coc.nvim'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'ThyW/elvish.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'glacambre/firenvim'
Plugin 'raimondi/delimitmate'
Plugin 'LnL7/vim-nix'
Plugin 'tpope/vim-fugitive'
Plugin 'sainnhe/gruvbox-material'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

call vundle#end()
filetype plugin indent on
]], false) -- don't return output
