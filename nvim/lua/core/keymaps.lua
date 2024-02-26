local keymap = vim.keymap.set

local funcs = require("..core.lib.functions")

local opts = { silent = true, noremap = true }

-- Buffer manipulation
keymap("n", "<leader>l", ":BufferLineCycleNext<CR>", opts)
-- Move to previous buffer.
keymap("n", "<leader>h", ":BufferLineCyclePrev<CR>", opts)
-- Switch buffer with the next buffer.
keymap("n", "<leader><leader>l", ":BufferLineMoveNext<CR>", opts)
-- Switch buffer with the previous buffer.
keymap("n", "<leader><leader>h", ":BufferLineMovePrev<CR>", opts)

-- Close a buffer.
keymap("", "<leader>bd", ":bd<CR>", { silent = true })
-- Move to the last visited buffer.
keymap("", "<leader><TAB>", "<c-^>", { silent = true })

-- Unmap arrow keys.
keymap("", "<Up>", "<Nop>")
keymap("", "<Down>", "<Nop>")
keymap("", "<Left>", "<Nop>")
keymap("", "<Right>", "<Nop>")

-- Move up and down 10 lines while keeping the cursor in the middle of the screen. This is something similar to <C-u> and <C-d>
keymap("", "zk", "10kzz<CR>", { silent = true })
keymap("", "zj", "10jzz<CR>", { silent = true })

-- 'jj' is a must
-- 'jk' is used in bash(vi mode)
keymap("i", "jj", "<esc>")

-- Toggle wrapping.
keymap("n", "<leader>ow", function()
	funcs.switch_wrap()
end, { silent = true, noremap = true })
-- Toggle spellcheck.
keymap("n", "<leader>os", "<cmd>set spell! <bar> set spell?<cr>", { silent = true, noremap = true })
-- Toggle 80 character colorcolumn.
keymap(
	"n",
	"<leader>oc",
	':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>',
	{ silent = true, noremap = true }
)
-- Source the current Vim file.
keymap("n", "<leader>cs", "<cmd>source %<cr>", { noremap = true })

-- ToggleTerm manipulation.
--[[ nmap("<C-t><C-t>", ":ToggleTerm<CR>", { noremap = true })
nmap("<C-t><C-v>", ":ToggleTerm direction=vertical<CR>", { noremap = true })
nmap("<C-t><C-f>", ":ToggleTerm size=20 direction=float shade_terminals=false<CR>", { noremap = true })
tmap("<C-t><C-c>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true }) ]]

-- Builtin Vim replace for quickly replacing the word under cursor.
keymap("n", "<leader>r", ":%s/<C-r><C-w>//gc<left><left><left>", { noremap = true })

-- Better line moving.
keymap("", "H", "^", { noremap = true })
keymap("", "L", "g_", { noremap = true })

-- NvimTree toggle.
-- nmap("<leader>of", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
keymap("n", "<leader>of", ":Explore<CR>", { silent = true, noremap = true })

-- Switch spelling language.
keymap("n", "<leader>oS", function()
	funcs.switch_spelling()
end, { silent = true, noremap = true })
keymap("n", "<leader>td", function()
	funcs.toggle_treesitter_debug()
end, { silent = true, noremap = false })

-- LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>", { silent = true, noremap = true })

-- nvim colorizer
keymap("n", "<leader>oC", ":ColorizerToggle<CR>", { silent = true, noremap = true })

-- nobla.nvim
keymap("n", "<leader>e", ":lua require('nabla').popup()<CR>", { silent = true, noremap = true })
