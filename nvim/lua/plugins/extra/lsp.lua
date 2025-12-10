local M = {}

M.lspconfig = require("lspconfig")

function M.on_attach(_, bufnr)
	local function buf_set_keymap(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	-- Mappings.
	local function opts(desc)
		return { noremap = true, silent = true, desc = desc }
	end

	vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", vim.lsp.buf.declaration, opts("LSP declaration"))
	buf_set_keymap("n", "gd", vim.lsp.buf.definition, opts("LSP definition"))
	buf_set_keymap("n", "K", vim.lsp.buf.hover, opts("LSP hover"))
	buf_set_keymap("n", "gi", vim.lsp.buf.implementation, opts("LSP implementation"))
	buf_set_keymap("n", "<C-K>", vim.lsp.buf.signature_help, opts("LSP signature help"))
	buf_set_keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts("LSP add WS folder"))
	buf_set_keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts("LSP remove WS folder"))
	buf_set_keymap("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("LSP list WS folders"))
	buf_set_keymap("n", "<space>D", vim.lsp.buf.type_definition, opts("LSP type definition"))
	buf_set_keymap("n", "<space>rn", vim.lsp.buf.rename, opts("LSP rename"))
	buf_set_keymap("n", "<space>ca", vim.lsp.buf.code_action, opts("LSP code action"))
	buf_set_keymap("n", "gr", vim.lsp.buf.references, opts("References"))
	buf_set_keymap("n", "<space>e", function()
		require("..core.lib.diagnostics").line_diagnostics()
	end, opts("LSP line diagnostics"))
	buf_set_keymap("n", "[d", function()
		require("..core.lib.diagnostics").goto_prev()
	end, opts("LSP prev diagnostic"))
	buf_set_keymap("n", "]d", function()
		require("..core.lib.diagnostics").goto_next()
	end, opts("LSP next diagnostic"))
	buf_set_keymap("n", "<space>q", function()
		require("..core.lib.diagnostics").location_list()
	end, opts("LSP location list"))
	buf_set_keymap("n", "<space>it", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, opts("LSP toggle inlay hints"))
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

M.capabilities = function()
	return require("cmp_nvim_lsp").default_capabilities()
end

return M
