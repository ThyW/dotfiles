" Do not try to be vi compatible
set nocompatible

" Add mouse to vim, scrolling, clicking highlighting
set mouse=a

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
set complete+=kspell

" Mapping of a leader key: <Space>
let mapleader = " "

" Setting the clipboard manager tow which to copy
" Does not work, because nvim is not complied with clipboard option
let g:clipboard = "xclip"
set clipboard=unnamedplus

" Time for a mapped key sequence to wait(leader + o + s)
set timeoutlen=2000 

" No text wrapping by default
set wrap!

" Line numbers and relative line numbers
set nu rnu

" Sign column next to line numbers; useful for error messages with linters
set signcolumn=yes

" Don't put a message about a mode you are in, in the command line
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

" Highlight 80th colum, to see if you went past it, currently disabled
" set colorcolumn=80

" For code and text folding
set foldmethod=indent

" How deep to fold 
set foldlevelstart=20

" set a special GUI font, I used this when I used a graphical nvim client
set guifont=Cousine:h18

" A fix for swap files
if !has('nvim')
    set viminfo+=n~/vim/.viminfo
else
    " Do nothing here to use the neovim default
    " or do something like:
    set viminfo+=n~/.local/share/nvim/shada/main.shada
endif

" Syntax highlighting on by default
syntax on

" Normal window splitting
set splitright
set splitbelow

" custom status line 
set laststatus=2 
set statusline=
" shows path to current file, relative to home
set statusline+=\ <<
set statusline+=\ %f
set statusline+=\ >>
" switches to the other side
set statusline+=%=
set statusline+=\ %m
" shows filetype
set statusline+=\ %Y
" current_column, current_line/max_lines
set statusline+=\ %c\ %l\/\%L

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" let Vundle manage Vundle, required
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

" Stuff for Rmarkdown, which I use for notetaking
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

" setting colorscheme and colors
colorscheme gruvbox
set termguicolors

highlight SignColumn guibg=none
highlight LineNr ctermfg=240
highlight CursorLineNr cterm=bold gui=bold guibg=none
highlight Pmenu ctermfg=white ctermbg=22 cterm=bold
highlight SpellBad ctermfg=red ctermbg=black cterm=underline 
highlight StatusLine ctermfg=black ctermbg=gray guibg=#efc169
highlight ColorColumn ctermbg=none
highlight Conceal ctermbg=none
highlight LspDiagnosticsError ctermfg=red
highlight LspDiagnosticsWarning ctermfg=cyan
highlight LspDiagnosticsInformation ctermfg=grey

" fzf config
let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1

" jump between buffers quickly
" very useful
map <silent><leader>h :bp <CR> 
map <silent><leader>l :bn <CR>
map <silent><leader>bd :bd! <CR>
map <silent><leader><TAB> <c-^>

" fzf binds
" search for files
noremap <silent><leader>F :Files<CR>
" search lines in open buffer
noremap <silent><leader>f :Lines <CR>

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

" Commenting for vim and rust
autocmd FileType rust nnoremap <buffer> gc :call ToggleComment("\\/\\/ ")<CR>
autocmd FileType vim nnoremap <buffer> gc :call ToggleComment('" ')<CR>
autocmd FileType python nnoremap <buffer> gc :call ToggleComment('#')<CR>

" exit terminal emulator
tnoremap jj <C-\><C-n>
inoremap jj <esc>

" turn of highlight
map <silent><F3> :set hlsearch!<CR> 

" return my cursor back to what it is in alacritty
au VimLeave * set guicursor=a:ver100

" ------------------------------ COMMANDS AND OPTIONS BINDS ------------------------
" toggle wrap and spell, thanks github.com/ralismark/ 
nnoremap <silent> <leader>ow <cmd>set wrap! <bar> set wrap?<cr>
nnoremap <silent> <leader>os <cmd>set spell! <bar> set spell?<cr>

nnoremap <silent> <leader>cs <cmd>source %<cr>

" Evaluate simple mathematical expression under cursor with *bc*
noremap <leader>m "yy:r!echo<space><C-r>y<space>\|<space>bc<enter>

" binds for compiling RMarkDown, TODO: see if rmarkdown plugin does this
" better
autocmd FileType rmd map <silent><F4> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter><CR>

" terminals 
noremap <leader>t :vs +terminal<CR>
noremap <leader>T :sp +terminal<CR>

" replace all occurances of a word on cursor
noremap <leader>r :%s/<C-r><C-w>/gc<left><left><left>

" better go to end of line and go to the beginning of line
noremap H ^
noremap L $

" ---------------------------------------------COC------------------------------------
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
	call CocActionAsync('doHover')
    else
	execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" nvim-tree-sitter configuration
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
	enable = true,              -- false will disable the whole extension
    },
}
EOF


" Toggle Leftexplore for moving through files
let g:lex_open = "false"
function! ToggleLex()
    if (g:lex_open == "true")
	execute 'Lex!'
	let g:lex_open = "false"
    else
    	execute 'Lex'
    	let g:lex_open = "true"
    endif
endfunction

" Bind it to <space>-o-f for toggling
nnoremap <silent><leader>of :call ToggleLex()<CR>
