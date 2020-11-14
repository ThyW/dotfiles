" Command-line (:) height
set cmdheight=1

" after this time in (ms) this a .swp file will be written to disc
set updatetime=500

" stuff with built in completion
set complete-=i

" Ignore completion errors
set shortmess+=c 

" Better completion experience
set completeopt=menuone,noinsert,noselect

" Mapping of a leader key: <Space>
let mapleader = " "

" Setting the clipboard manager tow which to copy
let g:clipboard = "xclip"

" Time for a mapped key sequence to wait(leader + o + s)
set timeoutlen=2000 

" No text wrapping by default
set wrap!

" Line numbers and relative line numbers
set nu rnu

" Sign column next to line numbers; useful for error messages with linters
set signcolumn=yes

" Don't put a message about a mode you are in
set noshowmode

" Automatically indent new lines
set autoindent

" Autoindent for C-like langauges(such as Rust) 
set smartindent

" Copy indent structure
set copyindent

" Tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Highlight 80th colum 
set colorcolumn=80

" For code and text folding
set foldmethod=indent

" How deep to fold 
set foldlevelstart=20

" A fix for swap files
if !has('nvim')
  set viminfo+=n~/vim/.viminfo
else
  " Do nothing here to use the neovim default
  " or do something like:
  set viminfo+=n~/.local/share/nvim/shada/main.shada
endif

" Custom color editing
" This color scheme is a modification of gruvbox-dark
"
" Syntax highlighting on by default
syntax on

" Color scheme
colorscheme gruvbox 

" Custom color changes
" highlight LineNr ctermfg=240 ctermbg=22
highlight SignColumn ctermfg=none ctermbg=none
" highlight CursorLineNr ctermfg=254 ctermbg=22 cterm=bold 
" highlight CocInfoSign ctermfg=247 ctermbg=22 cterm=bold
" highlight CocWarningSign ctermfg=247 ctermbg=22 cterm=bold
" highlight CocErrorSign ctermfg=red ctermbg=22 cterm=bold
highlight Pmenu ctermfg=white ctermbg=22 cterm=bold
" highlight SpellBad ctermfg=red ctermbg=black cterm=underline 
" highlight StatusLIne ctermfg=22 ctermbg=gray
" highlight ColorColumn ctermbg=22
" highlight Conceal ctermbg=none
" highlight LspDiagnosticsError ctermfg=red
" highlight LspDiagnosticsWarning ctermfg=cyan
" highlight LspDiagnosticsInformation ctermfg=grey

" Normal window splitting
set splitright
set splitbelow

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
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-latex/vim-latex'
Plugin 'tpope/vim-surround'
Plugin 'vifm/vifm.vim'
Plugin 'Yggdroot/indentLine'

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
local nvim_lsp = require'nvim_lsp'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.pyls.setup{}
nvim_lsp.ccls.setup{}

EOF

" Mappings for Window manipulation
map <silent><leader>wh :wincmd h<CR>
map <silent><leader>wj :wincmd j<CR>
map <silent><leader>wk :wincmd k<CR>
map <silent><leader>wl :wincmd l<CR>
map <silent><leader>wv :sp <CR>
map <silent><leader>ws :vs <CR>
map <silent><leader>w+ :resize +5 <CR>
map <silent><leader>w- :resize -5 <CR>

" jump between buffers quickly
map <silent><leader>h :bp <CR> 
map <silent><leader>l :bn <CR>
map <silent><leader>bd :bd! <CR>
map <silent><leader><TAB> <c-^>

" fzf binds
noremap <silent><leader>F :CocCommand fzf-preview.ProjectFiles <CR>
noremap <silent><leader>f :CocCommand fzf-preview.BufferLines <CR>

" Rebinding copy to paste to make them work with system clipboards
noremap <silent><C-c> :'<,'>w !xclip -selection clipboard<CR><CR>

" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" move up and down by 10 lines
noremap <silent>zk 10kzz<CR>
noremap <silent>zj 10jzz<CR>

" Page jumping
" TODO: Consider removing; not used that much
noremap <silent>zH <PageDown>zz<CR>
noremap <silent>zL <PageUp>zz<CR>

" comment and uncomment code, thx /u/ZySync
function! ToggleComment(comment_char)
	if getline(".") =~ "^" . a:comment_char
		execute ".s/^" . a:comment_char . "//g"
	else
		execute ".s/^/" . a:comment_char . "/g"
	endif
endfunction

autocmd FileType rust nnoremap <buffer> gc :call ToggleComment("\\/\\/ ")<CR>
autocmd FileType vim nnoremap <buffer> gc :call ToggleComment('" ')<CR>

"coc definition
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" nvim-lsp stuff
nnoremap <silent> <c-d> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.show_line_diagnostics()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.rename()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gk	<cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga	<cmd>lua vim.lsp.buf.code_action()<CR>

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

"exit terminal emulator
tnoremap jj <C-\><C-n>
inoremap jj <esc>

" turn of highlight
map <silent><F3> :set hlsearch!<CR> 

au VimLeave * set guicursor=a:ver100

" toggle wrap and spell, thanks github.com/ralismark/ 
nnoremap <silent> <leader>ow <cmd>set wrap! <bar> set wrap?<cr>
nnoremap <silent> <leader>os <cmd>set spell! <bar> set spell?<cr>

" custom status line 
set laststatus=2 
set statusline=
set statusline+=\ <<
set statusline+=\ %f
set statusline+=\ >>
set statusline+=%=
set statusline+=\ %m
set statusline+=\ %Y
set statusline+=\ %c\ %l\/\%L

" process and output mathematical expression in visual mode
" ---- cmd output ----
" 10 + 10
" 20

noremap <leader>m "yy:r!echo<space><C-r>y<space>\|<space>bc<enter>

autocmd FileType rmd map <silent><F4> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter><CR>
autocmd FileType python map <silent><F5> :!./%<CR>

noremap <leader>t :vs +terminal<CR>
noremap <leader>T :sp +terminal<CR>

autocmd FileType rust noremap <silent><F5> :sp<CR> :resize -20<CR> :term<CR>i
