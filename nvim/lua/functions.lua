M = {}

local o = vim.o

-- Function to switch the vim spellchecker spelling language.
-- This however has a simple caveat, where if the spell language is not downloaded, Vim asks you if you want to download it.
-- This however won't show up, if you have NetRW disabled, for example if you use NvimTree or some different file manager or file viewer.
-- This can be easily fixed by first enabling NetRW and then running this function again.
function M.switch_spelling()
    if vim.o.spelllang == "en" then
    	vim.o.spelllang = "sk"
    	print("Current spell lang: [sk]")
    else
    	vim.o.spelllang = "en"
    	print("Current spell lang: [en]")
    end
end

-- Switch the current text wrap, as well as maps j and k for better movement through the wrapped lines(see 'gj, gk').
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

return M
