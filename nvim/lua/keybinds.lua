-- mapping for all modes
local map = function(keys, action, opts)
  opts = opts or {}
  vim.keymap.set("", keys, action, opts)
end

-- normal mode mapping
local nmap = function(keys, action, opts)
  opts = opts or {}
  vim.keymap.set("n", keys, action, opts)
end

-- insert mode mapping
local imap = function(keys, action, opts)
  opts = opts or {}
  vim.keymap.set("i", keys, action, opts)
end

-- terminal mode mapping
local tmap = function(keys, action, opts)
  opts = opts or {}
  vim.keymap.set("t", keys, action, opts)
end

-- create a single autocommand
local au = function(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

local ag = function(name, opts)
  return vim.api.nvim_create_augroup(name, opts)
end

-- Buffer manipulation:
-- Move to next buffer.
nmap("<leader>l", ":BufferLineCycleNext<CR>", { silent = true, noremap = true })
-- Move to previous buffer.
nmap("<leader>h", ":BufferLineCyclePrev<CR>", { silent = true, noremap = true })
-- Switch buffer with the next buffer.
nmap("<leader><leader>l", ":BufferLineMoveNext<CR>", { silent = true, noremap = true })
-- Switch buffer with the previous buffer.
nmap("<leader><leader>h", ":BufferLineMovePrev<CR>", { silent = true, noremap = true })

-- Close a buffer.
map("<leader>bd", ":bd<CR>", { silent = true })
-- Move to the last visited buffer.
map("<leader><TAB>", "<c-^>", { silent = true })

-- Unmap arrow keys.
map("<Up>", "<Nop>")
map("<Down>", "<Nop>")
map("<Left>", "<Nop>")
map("<Right>", "<Nop>")

-- Move up and down 10 lines while keeping the cursor in the middle of the screen. This is something similar to <C-u> and <C-d>
map("zk", "10kzz<CR>", { silent = true })
map("zj", "10jzz<CR>", { silent = true })

-- 'jj' is a must
-- 'jk' is used in bash(vi mode)
imap("jj", "<esc>")

-- Toggle wrapping.
nmap("<leader>ow", function() require 'functions'.switch_wrap() end, { silent = true, noremap = true })
-- Toggle spellcheck.
nmap("<leader>os", "<cmd>set spell! <bar> set spell?<cr>", { silent = true, noremap = true })
-- Toggle 80 character colorcolumn.
nmap("<leader>oc", ':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>',
  { silent = true, noremap = true })
-- Source the current Vim file.
nmap("<leader>cs", "<cmd>source %<cr>", { noremap = true })

-- Three autocommands for quick execution in rmarkdown, python and lua files.
au("BufEnter", {
  pattern = "*.rmd",
  callback = function()
    vim.schedule(function()
      map("<f4>", ":!echo<space>\"require(rmarkdown);<space>render(\'<c-r>%\')\"<space>|<space>R<space>--vanilla<enter>"
      , { silent = true })
    end)
  end,
  group = ag("RmdBuildKeybind", { clear = true })
})
au("BufEnter",
  {
    group = ag("PythonRunKeybind", { clear = true }),
    pattern = "*.py",
    callback = function()
      vim.schedule(function()
        map("<f5>", ":!python3 <c-r>%<CR>", { silent = true })
      end)
    end
  })
au("BufEnter", {
  group = ag("LuaRunKeybind", { clear = true }),
  pattern = "*.lua",
  callback = function()
    vim.schedule(function()
      nmap("<f5>", ":luafile %<CR>", { silent = true })
    end)
  end
})



au("BufEnter", {
  group = ag("MarkdownBuildKeybind", { clear = true}),
  pattern = {"*.md", "*.MD"},
  callback = function()
    vim.schedule(function()
      map("<f4>", ":!pandoc % -o %.pdf<CR>"
      , { silent = true })
    end)
  end
})

-- ToggleTerm manipulation.
nmap("<C-t><C-t>", ":ToggleTerm<CR>", { noremap = true })
nmap("<C-t><C-v>", ":ToggleTerm direction=vertical<CR>", { noremap = true })
nmap("<C-t><C-f>", ":ToggleTerm size=20 direction=float shade_terminals=false<CR>", { noremap = true })
tmap("<C-t><C-c>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true })

-- Builtin Vim replace for quickly replacing the word under cursor.
nmap("<leader>r", ":%s/<C-r><C-w>//gc<left><left><left>", { noremap = true })

-- Better line moving.
map("H", "^", { noremap = true })
map("L", "$", { noremap = true })

-- NvimTree toggle.
nmap("<leader>of", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

-- Switch spelling language.
nmap("<leader>oS", function() require "functions".switch_spelling() end, { silent = true, noremap = true })
nmap("<leader>td", function() require "functions".toggle_treesitter_debug() end, { silent = true, noremap = false })

-- LazyGit
nmap("<leader>gg", ':LazyGit<CR>', { silent = true, noremap = true })

-- nvim colorizer
nmap("<leader>oC", ":ColorizerToggle<CR>", { silent = true, noremap = true })

-- nobla.nvim
nmap("<leader>e", ":lua require('nabla').popup()<CR>", { silent = true, noremap = true })
