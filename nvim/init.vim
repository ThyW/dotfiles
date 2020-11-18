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

" Nvim-lsp
Plugin 'neovim/nvim-lspconfig'
Plugin 'tjdevries/lsp_extensions.nvim'
Plugin 'nvim-lua/completion-nvim'
Plugin 'nvim-lua/diagnostic-nvim'

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

" Configuring lsp for rust-alnalyzer
lua <<EOF
-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.pyls.setup({ on_attach=on_attach })
nvim_lsp.ccls.setup({ on_attach=on_attach })

EOF

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'

" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" INLAY HINTS FINALLY
autocmd CursorHold *
\ lua require'lsp_extensions'.inlay_hints{ only_current_line = true, highlight = "NonText" }

" fzf config
let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1

" bufferines
" let g:bufferline_active_buffer_right = ' '
" let g:bufferline_active_buffer_left = ' '
" let g:bufferline_show_bufnr = 1
" let g:bufferline_modified = '*'

let g:pandoc#module#enable = ["command", "menu", "keyboard", "completion"]

colorscheme gruvbox

source ~/.config/nvim/settings.vim
source ~/.config/nvim/binds.vim
