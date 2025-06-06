local api = vim.api

local lua_format = api.nvim_create_augroup("LuaFormat", {
	clear = true,
})

-- this is a temporary solution for lua formatting
-- once sumneko lsp supports their settings, this can be removed
api.nvim_create_autocmd({ "BufEnter" }, {
	group = lua_format,
	pattern = { "*.lua" },
	callback = function()
		vim.cmd("set tabstop=2")
		vim.cmd("set shiftwidth=2")
		vim.cmd("set softtabstop=2")
		vim.cmd("set noexpandtab")
	end,
})

local derfile = api.nvim_create_augroup("Derfile", {
	clear = true,
})

api.nvim_create_autocmd({ "BufEnter" }, {
	group = derfile,
	pattern = { "derfile" },
	callback = function()
		vim.cmd("set ft=toml")
	end,
})

local haskell_spaces = api.nvim_create_augroup("HaskellSpaces", {
	clear = true,
})

api.nvim_create_autocmd({ "BufEnter" }, {
	group = haskell_spaces,
	pattern = { "*.hs", "*.hsl" },
	callback = function()
		vim.cmd([[set tabstop=4]])
		vim.cmd([[set shiftwidth=4]])
		vim.cmd([[set softtabstop=4]])
		vim.cmd([[set expandtab]])
	end,
})

api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*.i3config",
	callback = function()
		vim.cmd([[set ft=i3config]])
	end,
})

local cbuff = vim.api.nvim_create_augroup("Cbuffer", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	group = cbuff,
	pattern = { "*.c", "*.h" },
	callback = function()
		vim.opt.scrolloff = 12
		vim.cmd([[set ft=c]])
		vim.cmd([[set tabstop=4]])
		vim.cmd([[set shiftwidth=4]])
		vim.cmd([[set softtabstop=4]])
		vim.cmd([[set expandtab]])
	end,
})
