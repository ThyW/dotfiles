vim.api.nvim_exec([[
nnoremap <silent> <leader>l :BufferLineCycleNext<CR>
nnoremap <silent> <leader>h :BufferLineCyclePrev<CR>
nnoremap <silent> <leader><leader>l :BufferLineMoveNext<CR>
nnoremap <silent> <leader><leader>h :BufferLineMovePrev<CR>
map <silent> <leader>bd :bd<CR>
map <silent> <leader><TAB> <c-^>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap <silent> zk 10kzz<CR>
noremap <silent> zj 10jzz<CR>

inoremap jj <esc>

nnoremap <silent> <leader>ow :lua require"functions".switch_wrap()<cr>
nnoremap <silent> <leader>os <cmd>set spell! <bar> set spell?<cr>
nnoremap <silent> <leader>oc :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>

nnoremap <silent> <leader>cs <cmd>source %<cr>

autocmd FileType rmd map <silent><F4> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd FileType py map <silent><F5> :!python3 <c-r>%<CR>
autocmd FileType lua map <silent><F5> :luafile %<CR><CR>

noremap <C-t><C-t> :ToggleTerm<CR>
noremap <C-t><C-v> :ToggleTerm direction=vertical<CR>
noremap <C-t><C-f> :ToggleTerm size=20 direction=float shade_terminals=false<CR>
tnoremap <C-t><C-c> <C-\><C-n>:ToggleTerm<CR>

noremap <leader>r :%s/<C-r><C-w>//gc<left><left><left>

noremap H ^
noremap L $

nnoremap <silent> <leader>oh :RustToggleInlayHints<CR><CR>
nnoremap <silent> <leader>of :NvimTreeToggle<CR>
nnoremap <silent> <leader>oS :lua require"functions".switch_spelling()<CR>
]], false)

--[[ local ft = require("float_term")
ft.setup() ]]
