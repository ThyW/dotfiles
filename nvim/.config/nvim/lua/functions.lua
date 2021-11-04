local g = vim.g

function Switch_spelling()
    local langs = {"sk", "en"}
    if vim.o.spelllang == "en" then
    	vim.o.spelllang = langs[1]
    	print("sk")
    else
    	vim.o.spelllang = langs[2]
    	print("en")
    end
end

function Switch_wrap()
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

g.lex_open = 0
local exec = vim.cmd

-- toggle Lexplore
function Togglelex()
    if g.lex_open == 1 then
	 exec'Lex!'
	 g.lex_open = 0
    else
	exec'Lex'
	exec'vertical resize 20'
	g.lex_open = 1
    end
end

-- create slovak specific keybinds
g.using_langmap = 0
function ToggleKbLang()
    if g.using_langmap == 1 then
	exec
	[[
	augroup kbmap 
	    au!
	augroup END
	]]
	print("using us")
	g.using_langmap = 0
    else
	print("using sk")
    	exec[[
    	augroup kbmap
	    au!
	    autocmd InsertEnter * silent! :!setxkbmap sk
	    autocmd InsertLeave * silent! :!setxkbmap us
	augroup END
    	]]
	g.using_langmap = 1
    end
end


exec([[
nnoremap <silent><leader>of :NvimTreeToggle<CR>
nnoremap <silent><leader>oS :lua Switch_spelling()<CR><CR>
nnoremap <silent><leader>oL :lua ToggleKbLang()<CR><CR>
]])
