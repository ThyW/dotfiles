" Command-line (:) height
set cmdheight=2

" after this time in (ms) this a .swp file will be written to disc
set updatetime=400

" stuff with built in completion
set complete-=i

" Ignore completion errors
set shortmess+=c 

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
colorscheme desert

" Custom color changes
highlight LineNr ctermfg=240 ctermbg=22
highlight SignColumn ctermfg=22 ctermbg=22
highlight CursorLineNr ctermfg=254 ctermbg=22 cterm=bold 
highlight CocInfoSign ctermfg=247 ctermbg=22 cterm=bold
highlight CocWarningSign ctermfg=247 ctermbg=22 cterm=bold
highlight CocErrorSign ctermfg=red ctermbg=22 cterm=bold
highlight Pmenu ctermfg=white ctermbg=22 cterm=bold
highlight SpellBad ctermfg=red ctermbg=black cterm=underline 
highlight StatusLIne ctermfg=22 ctermbg=gray
highlight ColorColumn ctermbg=22
highlight Conceal ctermbg=white ctermbg=none

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
Plugin 'bling/vim-bufferline'
Plugin 'morhetz/gruvbox'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-latex/vim-latex'
Plugin 'tpope/vim-surround'
Plugin 'vifm/vifm.vim'

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
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" fzf config
let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1

" bufferines
let g:bufferline_active_buffer_right = ' '
let g:bufferline_active_buffer_left = ' '
let g:bufferline_show_bufnr = 1
let g:bufferline_modified = '*'

" auto format rust files on save
let g:rustfmt_autosave = 1

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

"
function! Preview()
		:call Compile()<CR><CR>
		execute "!sw zathura /tmp/op.pdf"
endfunction

function! Compile()
		let extension = expand('%:e')
		if extension == "ms"
				execute "!groff -ms % -T pdf > /tmp/op.pdf"
		elseif extension == "tex"
				execute "!pandoc -f latex -t latex % -o /tmp/op.pdf"
		elseif extension == "md"
				execute "!pandoc % --pdf-engine=context -o /tmp/op.pdf"
		endif
endfunction


noremap <leader>op :call Preview()<CR><CR><CR>
noremap <leader>oc :call Compile()<CR><CR>

autocmd FileType rmd map <silent><F4> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter><CR>
autocmd FileType python map <silent><F5> :!./%<CR>

noremap <leader>t :vs +terminal<CR>
noremap <leader>T :sp +terminal<CR>
