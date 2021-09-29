vim.api.nvim_exec([[
map <silent><leader>h :bp <CR> 
map <silent><leader>l :bn <CR>
map <silent><leader>bd :bd! <CR>
map <silent><leader><TAB> <c-^>

noremap <silent><leader>f :Files<CR>
noremap <silent><leader>F :Lines<CR>
noremap <silent><leader>b :Buffers<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap <silent>zk 10kzz<CR>
noremap <silent>zj 10jzz<CR>

tnoremap jj <C-\><C-n>
inoremap jj <esc>

map <silent><F3> :set hlsearch!<CR> 

nnoremap <silent> <leader>ow :lua switch_wrap()<cr>
nnoremap <silent> <leader>os <cmd>set spell! <bar> set spell?<cr>
nnoremap <silent> <leader>oc :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>

nnoremap <silent> <leader>cs <cmd>source %<cr>

autocmd FileType rmd map <silent><F4> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

noremap <leader>t :vs +terminal<CR>
noremap <leader>T :sp +terminal<CR>

noremap <leader>r :%s/<C-r><C-w>//gc<left><left><left>

noremap H ^
noremap L $

nnoremap <silent><leader>oh :RustToggleInlayHints<CR><CR>
]], false)
