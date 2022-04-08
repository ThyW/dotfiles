local o = vim.o
local g = vim.g
local kbs = vim.api.nvim_set_keymap
local kbd = vim.api.nvim_del_keymap
g.own_treesitter_debug = false

M = {}
-- Function to switch the vim spellchecker spelling language.
-- This however has a simple caveat, where if the spell language is not downloaded, Vim asks you if you want to download it.
-- This however won't show up, if you have NetRW disabled, for example if you use NvimTree or some different file manager or file viewer.
-- This can be easily fixed by first enabling NetRW and then running this function again.
function M.switch_spelling()
    if o.spelllang == "en" then
    	o.spelllang = "sk"
    	print("Current spell lang: [sk]")
    else
    	o.spelllang = "en"
    	print("Current spell lang: [en]")
    end
end

-- Switch the current text wrap, as well as maps j and k for better movement through the wrapped lines(see 'gj, gk').
function M.switch_wrap()
    if o.wrap then
	o.wrap = false
	kbs("n", "j", "j", {noremap = true, silent = true})
	kbs("n", "k", "k", {noremap = true, silent = true})
	print("Wrap: [OFF]")
    else
    	o.wrap = true
	kbs("n", "j", "gj", {noremap = true, silent = true})
	kbs("n", "k", "gk", {noremap = true, silent = true})
	print("Wrap: [ON]")
    end
end

-- Enter a special mode when debugging treesitter.
-- This mode creates two keybindings:
-- gtc -> toggle Tree-sitter highlight captures under cursor
-- gtp -> toggle Tree-sitter playground
function M.toggle_treesitter_debug()
    if g.own_treesitter_debug then
    	print("treesitter debug: [OFF]")
	g.own_treesitter_debug = false
    	kbd("n", "gtc")
    	kbd("n", "gtp")
    else
    	g.own_treesitter_debug = true
    	print("treesitter debug: [ON]")
	kbs("n", "gtc", ":TSHighlightCapturesUnderCursor<CR>", {noremap = true, silent = true})
	kbs("n", "gtp", ":TSPlaygroundToggle<CR>", {noremap = true, silent = true})
    end
end

return M
