local g = vim.g

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

g.lex_open = 0
local exec = vim.cmd

function togglelex()
    if g.lex_open == 1 then
	 exec'Lex!'
	 g.lex_open = 0
    else
	exec'Lex'
	g.lex_open = 1
    end
end

exec([[
nnoremap <silent><leader>of :call ToggleLex()<CR>
nnoremap <silent><leader>oS :lua switch_spelling()<CR><CR>
]])
