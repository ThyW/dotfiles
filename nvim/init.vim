" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'hugolgst/vimsence'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'vifm/vifm.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" fzf config
let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1

" bufferines
" let g:bufferline_active_buffer_right = ' '
" let g:bufferline_active_buffer_left = ' '
" let g:bufferline_show_bufnr = 1
" let g:bufferline_modified = '*'

colorscheme gruvbox

source ~/.config/nvim/settings.vim
source ~/.config/nvim/binds.vim
