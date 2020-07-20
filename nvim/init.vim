set hidden
set nocompatible " be iMproved, required
filetype off                  " required
set cmdheight=2
set updatetime=500
set complete-=i
set shortmess+=c
let mapleader = " "
set clipboard+=unnamedplus
set timeoutlen=2000 
set wrap!

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

" Wincmd mappings
map <silent><leader>h :wincmd h<CR>
map <silent><leader>j :wincmd j<CR>
map <silent><leader>k :wincmd k<CR>
map <silent><leader>l :wincmd l<CR>
map <silent><leader>wv :sp <CR>
map <silent><leader>ws :vs <CR>

" calls functions to hide and show numbers and signcolumn
noremap <leader>cc :call HideSignColumn()<CR>

" jump between buffers quickly
noremap <leader>b :bp <CR> 
noremap <leader>B :bn <CR>
noremap <leader><TAB> <c-^>

" fzf binds
noremap <leader>F :Files <CR>
noremap <leader>f :Lines <CR>
" function to hide numbers and signcolumn
function! HideSignColumn()
		set nu! rnu!	
endfunction

" Pagejumping
noremap <leader>H <PageDown><CR>
noremap <leader>L <PageUp><CR>

" Rebinding copy to paste to make them work with system clipboads
" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
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

" c-space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

inoremap jj <esc>

" fzf config
let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1
