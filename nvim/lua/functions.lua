M = {}

local g = vim.g
local exec = vim.cmd
local o = vim.o

function M.switch_spelling()
    if vim.o.spelllang == "en" then
    	vim.o.spelllang = "sk"
    	print("Current spell lang: [sk]")
    else
    	vim.o.spelllang = "en"
    	print("Current spell lang: [en]")
    end
end

function M.switch_wrap()
    if o.wrap then
	o.wrap = false
	vim.api.nvim_set_keymap("n", "j", "j", {noremap = true, silent = true})
	vim.api.nvim_set_keymap("n", "k", "k", {noremap = true, silent = true})
	print("Wrap: [OFF]")
    else
    	o.wrap = true
	vim.api.nvim_set_keymap("n", "j", "gj", {noremap = true, silent = true})
	vim.api.nvim_set_keymap("n", "k", "gk", {noremap = true, silent = true})
	print("Wrap: [ON]")
    end
end


-- toggle Lexplore
function M._toggle_lex()
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
function M.toggle_kb_lang()
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
	    autocmd InsertEnter * silent! :!setxkbmap sk -variant qwerty
	    autocmd InsertLeave * silent! :!setxkbmap us
	augroup END
    	]]
	g.using_langmap = 1
    end
end

return M
