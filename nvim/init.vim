set hidden	
filetype off                  
set cmdheight=2
set updatetime=5000
set complete-=i
set shortmess+=c
let mapleader = " "
set clipboard+=unnamedplus
set timeoutlen=2000 
set wrap!
set expandtab

" set up hybrid line number
set nu rnu
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'hugolgst/vimsence'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'bling/vim-bufferline'

" All of your Plugins must be added before the following line
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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set number
syntax on
set tabstop=4
colorscheme desert
set signcolumn=yes:2

" Wincmd mappings
map <silent><leader>wh :wincmd h<CR>
map <silent><leader>wj :wincmd j<CR>
map <silent><leader>wk :wincmd k<CR>
map <silent><leader>wl :wincmd l<CR>
map <silent><leader>wv :sp <CR>
map <silent><leader>ws :vs <CR>

" jump between buffers quickly
noremap <leader>h :bp <CR> 
noremap <leader>l :bn <CR>
noremap <leader>bd :bd <CR>
noremap <leader><TAB> <c-^>

" fzf binds
noremap <leader>F :CocCommand fzf-preview.ProjectFiles <CR>
noremap <leader>f :CocCommand fzf-preview.BufferLines <CR>

" function to hide numbers and signcolumn
function! HideSignColumn()
		set nu! rnu!	
endfunction

" Pagejumping
noremap <leader>H <PageDown><CR>
noremap <leader>L <PageUp><CR>

" Rebinding copy to paste to make them work with system clipboards
" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" autoinserting double parenthesees
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" move up and down by 10 lines
noremap <Up> <C-u> <CR>
noremap <Down> <C-d> <CR>

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

" Racer config
let g:racer_cmd = "/home/zir/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

" GoTo code navigation.
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
  return !col || getline('.')[col - 1]  =~# '\s'
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

inoremap jj <esc>

" fzf config
let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1

" bufferines
let g:bufferline_active_buffer_right = ' '
let g:bufferline_active_buffer_left = ' '
let g:bufferline_show_bufnr = 1
let g:bufferline_modified = '*'
