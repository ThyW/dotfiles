local api = vim.api
local o = vim.o

local lua_format = api.nvim_create_augroup("LuaFormat", {
  clear = true
})

-- this is a temporary solution for lua formatting
-- once sumneko lsp supports their settings, this can be removed
api.nvim_create_autocmd({ "BufEnter, BufWinEnter" }, {
  group = lua_format,
  pattern = { "*.lua" },
  callback = function()
    vim.cmd [[set tabstop=2]]
    vim.cmd [[set shiftwidth=2]]
    vim.cmd [[set softtabstop=2]]
    vim.cmd [[set expandtab]]
  end
})

-- hot config reloading for lua and other dotfiles
local der_apply = api.nvim_create_augroup("DerApply", {
  clear = true
})

api.nvim_create_autocmd({ "BufWritePost" }, {
  group = der_apply,
  pattern = { "/home/zir/clones/dotfiles/*" },
  callback = function()
    local path = vim.fn.system("git rev-parse --show-toplevel", nil)
    local stripped_path = string.gsub(path, "\n", "", nil)
    local cmd = "der -f " .. stripped_path .. "/derfile -a"
    vim.fn.system(cmd, nil)
  end
})

local der_apply_lua = api.nvim_create_augroup("DerApply", {
  clear = true
})

api.nvim_create_autocmd({ "BufWritePost" }, {
  group = der_apply_lua,
  pattern = { "/home/zir/clones/dotfiles/*.lua" },
  callback = function()
    local path = vim.fn.system("git rev-parse --show-toplevel", nil)
    local stripped_path = string.gsub(path, "\n", "", nil)
    local cmd = "der -f " .. stripped_path .. "/derfile -a"
    vim.fn.system(cmd, nil)
  end
})

-- autocmd group for automatic python formatting on writing to a file
local python_formatting = api.nvim_create_augroup("PythonFormatting", {
  clear = true,
})

api.nvim_create_autocmd({ "BufWritePost" }, {
  group = python_formatting,
  pattern = { "*.py" },
  callback = function()
    local cur_file = vim.api.nvim_buf_get_name(0)
    vim.fn.system("black -l 80 -q " .. cur_file, nil)
    vim.cmd("edit %")
  end
})

local markdown_enter = api.nvim_create_augroup("MarkdownEnter", {
  clear = true,
})

api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = markdown_enter,
  pattern = { "*.md" },
  callback = function()
    o.spell = true
    o.wrap = true
  end
})

api.nvim_create_autocmd({ "BufLeave" }, {
  group = markdown_enter,
  pattern = { "*.md" },
  callback = function()
    o.spell = false
    o.wrap = false
  end
})

local derfile = api.nvim_create_augroup("Derfile", {
  clear = true,
})

api.nvim_create_autocmd({ "BufEnter" }, {
  group = derfile,
  pattern = { "derfile" },
  callback = function()
    vim.cmd("set ft=toml")
  end
})

local haskell_spaces = api.nvim_create_augroup("HaskellSpaces", {
  clear = true,
})

api.nvim_create_autocmd({ "BufEnter" }, {
  group = haskell_spaces,
  pattern = { "*.hs", "*.hsl" },
  callback = function()
    vim.cmd [[set tabstop=4]]
    vim.cmd [[set shiftwidth=4]]
    vim.cmd [[set softtabstop=4]]
    vim.cmd [[set expandtab]]
  end
})

api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*.i3config",
  callback = function()
    vim.cmd [[set ft=i3config]]
  end
})
