"==============================================================================
"				Settings
"==============================================================================
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
set clipboard+=unnamedplus

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

" better line wrapping
set linebreak
set breakindent 
" Highlight 80th colum, to see if you went past it, currently disabled
" set colorcolumn=80

" For code and text folding
set foldmethod=indent

" How deep to fold 
set foldlevelstart=20

" set a special GUI font, I used this when I used a graphical nvim client
set guifont=FiraCode:h14

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

"==============================================================================
"				Plugin Manager
"==============================================================================
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
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'ThyW/elvish.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'glacambre/firenvim'
Plugin 'raimondi/delimitmate'
Plugin 'LnL7/vim-nix'
Plugin 'tpope/vim-fugitive'
Plugin 'sainnhe/gruvbox-material'
" Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-lua/lsp_extensions.nvim'
Plugin 'hrsh7th/nvim-compe'

" Stuff for Rmarkdown, which I use for notetaking
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

Plugin 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plugin 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call vundle#end()            " required
filetype plugin indent on    " required

"
"==============================================================================
"				    Color Settings
"==============================================================================
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


"==============================================================================
"				    Binds
"==============================================================================
lua <<EOF
-- LUA FUNCTIONS
function switch_spelling()
    local langs = {"sk", "en"}
    if vim.o.spelllang == "en" then
    	vim.o.spelllang = langs[1]
    	print("sk")
    else
    	vim.o.spelllang = langs[2]
    	print("en")
    end 
end

function switch_wrap()
    if vim.o.wrap then
	vim.o.wrap = false
	vim.api.nvim_set_keymap("n", "j", "j", {noremap = true, silent = true})
	vim.api.nvim_set_keymap("n", "k", "k", {noremap = true, silent = true})
	print("Wrap off")
    else 
    	vim.o.wrap = true
	vim.api.nvim_set_keymap("n", "j", "gj", {noremap = true, silent = true})
	vim.api.nvim_set_keymap("n", "k", "gk", {noremap = true, silent = true})
	print("Wrap on")
    end
end
EOF

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
noremap <silent><leader>f :Files<CR>
" search lines in open buffer
noremap <silent><leader>F :Lines <CR>

" Rebinding copy to paste to make them work with system clipboards
noremap <silent><C-c> y:call system('xclip', @+)<CR>

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

" ------------------------------ COMMANDS AND OPTION BINDS ------------------------
" toggle wrap and spell, thanks github.com/ralismark/ 
" nnoremap <silent> <leader>ow <cmd>set wrap! <bar> set wrap?<cr> :lua switch_wrap() <cr>
nnoremap <silent> <leader>ow :lua switch_wrap()<cr>
nnoremap <silent> <leader>os <cmd>set spell! <bar> set spell?<cr>
nnoremap <silent> <leader>oc :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>

nnoremap <silent> <leader>cs <cmd>source %<cr>

" Evaluate simple mathematical expression under cursor with *bc*
noremap <leader>m "yy:r!echo<space><C-r>y<space>\|<space>bc<enter>

" binds for compiling RMarkDown, TODO: see if rmarkdown plugin does this
" better
autocmd FileType rmd map <silent><F4> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" terminals 
noremap <leader>t :vs +terminal<CR>
noremap <leader>T :sp +terminal<CR>

" replace all occurances of a word on cursor
noremap <leader>r :%s/<C-r><C-w>//gc<left><left><left>

" better go to end of line and go to the beginning of line
noremap H ^
noremap L $

" ---------------------------------------------COQ------------------------------------
let g:coq_settings = { 'auto_start': 'shut-up' }

" ---------------------------------------------COC------------------------------------
" inoremap <silent><expr> <TAB>
	    " "\ pumvisible() ? "\<C-n>" :
	    " "\ <SID>check_back_space() ? "\<TAB>" :
	    " "\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <c-space> to trigger completion.
" if has('nvim')
    " inoremap <silent><expr> <c-space> coc#refresh()
" else
    " inoremap <silent><expr> <c-@> coc#refresh()
" endif
" 
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	    " "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" 
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
    " if (index(['vim','help'], &filetype) >= 0)
	" execute 'h '.expand('<cword>')
    " elseif (coc#rpc#ready())
	" call CocActionAsync('doHover')
    " else
	" execute '!' . &keywordprg . " " . expand('<cword>')
    " endif
" endfunction

" nvim-tree-sitter configuration
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
	enable = true,              -- false will disable the whole extension
    },
}


local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>af', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
local servers = { 'pyright', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require'compe'.setup {
  enabled = false;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
EOF

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

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
" Switch spelllangs
nnoremap <silent><leader>oS :lua switch_spelling()<CR><CR>

