local keymap = vim.keymap.set

local funcs = require("..core.lib.functions")

local function opts(desc, callback)
	return { silent = true, noremap = true, desc = desc, callback or nil }
end

-- Buffer manipulation
keymap("n", "<leader>l", ":BufferLineCycleNext<CR>", opts("next buffer"))
-- Move to previous buffer.
keymap("n", "<leader>h", ":BufferLineCyclePrev<CR>", opts("previous buffer"))
-- Switch buffer with the next buffer.
keymap("n", "<leader><leader>l", ":BufferLineMoveNext<CR>", opts("move buffer right"))
-- Switch buffer with the previous buffer.
keymap("n", "<leader><leader>h", ":BufferLineMovePrev<CR>", opts("move buffer left"))

-- Close a buffer.
keymap("", "<leader>bd", ":bd<CR>", opts("delete buffer"))
-- Move to the last visited buffer.
keymap("", "<leader><TAB>", "<c-^>", opts("goto last open buffer"))

-- Unmap arrow keys.
keymap("", "<Up>", "<Nop>")
keymap("", "<Down>", "<Nop>")
keymap("", "<Left>", "<Nop>")
keymap("", "<Right>", "<Nop>")

-- Move up and down 10 lines while keeping the cursor in the middle of the screen. This is something similar to <C-u> and <C-d>
keymap("", "zk", "10kzz<CR>", opts("move 10 lines UP"))
keymap("", "zj", "10jzz<CR>", opts("move 10 lines DOWN"))

-- 'jj' is a must
-- 'jk' is used in bash(vi mode)
keymap("i", "jj", "<esc>")

-- Toggle wrapping.
keymap("n", "<leader>ow", function()
	funcs.switch_wrap()
end, opts("toggle text wrapping"))
-- Toggle spellcheck.
keymap("n", "<leader>os", "<cmd>set spell! <bar> set spell?<cr>", opts("toggle spell checking"))
-- Toggle 80 character colorcolumn.
keymap(
	"n",
	"<leader>oc",
	':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>',
	opts("toggle colorcolumn")
)
-- Source the current Vim file.
keymap("n", "<leader>cs", "<cmd>source %<cr>", opts("source current vim/lua file"))

-- Builtin Vim replace for quickly replacing the word under cursor.
keymap("n", "<leader>r", ":%s/<C-r><C-w>//gc<left><left><left>", opts("rename word under cursor"))

-- Better line moving.
keymap("", "H", "^", opts("goto start of line"))
keymap("", "L", "g_", opts("goto start of text"))

-- Switch spelling language.
keymap("n", "<leader>oS", function()
	funcs.switch_spelling()
end, opts("switch spelling language"))
keymap("n", "<leader>td", function()
	funcs.toggle_treesitter_debug()
end, opts("toggle treesitter debug"))

-- nvim colorizer
keymap("n", "<leader>oC", ":ColorizerToggle<CR>", opts("toggle colorizer"))
