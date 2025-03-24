local M = {}

M.lspconfig = require("lspconfig")

function M.on_attach(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", '<cmd>lua require"..core.lib.diagnostics".line_diagnostics()<CR>', opts)
	buf_set_keymap("n", "[d", '<cmd>lua require"..core.lib.diagnostics".goto_prev()<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua require"..core.lib.diagnostics".goto_next()<CR>', opts)
	buf_set_keymap("n", "<space>q", '<cmd>lua require"..core.lib.diagnostics".location_list()<CR>', opts)

	vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function M.hook(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
vim.lsp.util.open_floating_preview = M.hook

M.rtp = vim.split(package.path, ";")
table.insert(M.rtp, "lua/?.lua")
table.insert(M.rtp, "lua/?/init.lua")

M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

return M
