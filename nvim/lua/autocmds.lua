local api = vim.api
local o = vim.o

local funcs = require("functions")

local lua_format = api.nvim_create_augroup("LuaFormat", {
	clear = true,
})

-- this is a temporary solution for lua formatting
-- once sumneko lsp supports their settings, this can be removed
api.nvim_create_autocmd({ "BufEnter" }, {
	group = lua_format,
	pattern = { "*.lua" },
	callback = function()
		vim.cmd([[set tabstop=2]])
		vim.cmd([[set shiftwidth=2]])
		vim.cmd([[set softtabstop=2]])
		vim.cmd([[set noexpandtab]])
	end,
})

local markdown_enter = api.nvim_create_augroup("MarkdownEnter", {
	clear = true,
})

api.nvim_create_autocmd({ "BufEnter" }, {
	group = markdown_enter,
	pattern = { "*.md" },
	callback = function()
		o.wrap = true
		funcs.wrap_keybinds(true)
		o.spell = true
		vim.cmd([[set tabstop=4]])
		vim.cmd([[set shiftwidth=4]])
		vim.cmd([[set softtabstop=4]])
		vim.cmd([[set expandtab]])
	end,
})

api.nvim_create_autocmd({ "BufLeave" }, {
	group = markdown_enter,
	pattern = { "*.md" },
	callback = function()
		o.spell = false
		o.wrap = false
		funcs.wrap_keybinds(false)
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

--[[ vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr, false)
  end,
}) ]]

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

--[[ local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  -- require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree }) ]]
