local o = vim.o
local g = vim.g
local set = vim.keymap.set
local del = vim.keymap.del
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

function M.wrap_keybinds(on)
	if on then
		set("", "j", "gj", { noremap = true, silent = true })
		set("", "k", "gk", { noremap = true, silent = true })
		set("", "H", "g^", { noremap = true, silent = true, desc = "goto start of line" })
		set("", "L", "g$", { noremap = true, silent = true, desc = "goto end of line" })
		set("", "zk", "10gk", { noremap = true, silent = true, desc = "10 visual lines up" })
		set("", "zj", "10gj", { noremap = true, silent = true, desc = "10 visual lines down" })
	else
		set("", "j", "j", { noremap = true, silent = true })
		set("", "k", "k", { noremap = true, silent = true })
		set("", "H", "^", { noremap = true, silent = true, desc = "goto start of line" })
		set("", "L", "$", { noremap = true, silent = true, desc = "goto end of line" })
		set("", "zk", "10k", { noremap = true, silent = true, desc = "10 lines up" })
		set("", "zj", "10j", { noremap = true, silent = true, desc = "10 lines down" })
	end
end

local wk = M.wrap_keybinds

-- Switch the current text wrap, as well as maps j and k for better movement through the wrapped lines(see 'gj, gk').
function M.switch_wrap(silent)
	if o.wrap then
		o.wrap = false
		wk(false)
		if not silent then
			print("Wrap: [OFF]")
		end
	else
		o.wrap = true
		wk(true)
		if not silent then
			print("Wrap: [ON]")
		end
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
		del("n", "gtc")
		del("n", "gtp")
	else
		g.own_treesitter_debug = true
		print("treesitter debug: [ON]")
		set("n", "gtc", ":TSHighlightCapturesUnderCursor<CR>", { noremap = true, silent = true })
		set("n", "gtp", ":TSPlaygroundToggle<CR>", { noremap = true, silent = true })
	end
end

function M.enable_filetype_lsp()
	local ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
	local ok, mason_lsp = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end
	local mappings = mason_lsp.get_mappings()
	local installed = mason_lsp.get_installed_servers()
	local ft_mappings = mappings["filetypes"]
	local available_clients = ft_mappings[ft]
	if available_clients == nil then
		return
	end
	local to_run = {}
	for _, lsp in ipairs(available_clients) do
		if vim.tbl_contains(installed, lsp) then
			table.insert(to_run, lsp)
		end
	end
	vim.lsp.enable(to_run)
end

return M
