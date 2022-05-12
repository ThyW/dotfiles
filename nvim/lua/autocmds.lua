local api = vim.api

local id = api.nvim_create_augroup("LuaFormat", {
  clear = true
})

-- this is a temporary solution for lua formatting
-- once sumneko lsp supports their settings, this can be removed
api.nvim_create_autocmd({ "BufEnter, BufWinEnter" }, {
  group = id,
  pattern = { "*.lua" },
  callback = function()
    vim.cmd [[set tabstop=2]]
    vim.cmd [[set shiftwidth=2]]
    vim.cmd [[set softtabstop=2]]
    vim.cmd [[set expandtab]]
  end
})
