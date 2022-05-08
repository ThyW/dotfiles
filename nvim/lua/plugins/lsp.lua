local nvim_lsp = require 'lspconfig'

local on_attach = function(_, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua require"diagnostics".line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua require"diagnostics".goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua require"diagnostics".goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua require"diagnostics".location_list()<CR>', opts)
	buf_set_keymap('n', '<space>af', '<cmd>lua vim.lsp.buf.format( { async = true } )<CR>', opts)
end

local servers = { 'pyright', 'rust_analyzer', 'clangd', 'html', 'phpactor', 'nickel_ls' }

-- lua setup
local sumneko_path = '/usr/bin/lua-language-server'
local rtp = vim.split(package.path, ';')

table.insert(rtp, "lua/?.lua")
table.insert(rtp, "lua/?/init.lua")


nvim_lsp['sumneko_lua'].setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { sumneko_path };
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = rtp,
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false
			}
		}
	}
}

for _, lsp in ipairs(servers) do
	local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
	if lsp == "html" then
		local cps = capabilities
		cps.textDocument.completion.completionItem.snippetSupport = true
		nvim_lsp[lsp].setup {
			on_attach = on_attach,
			capabilities = cps,
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "htmldjango" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embededLanguages = {
					css = true,
					javascript = true,
				}
			},
			single_file_support = true,
		}
	elseif lsp == "phpactor" then
		nvim_lsp["phpactor"].setup {
			on_attach = on_attach,
			cmd = { "phpactor", "language-server" },
			filetypes = { "php", "html" },
		}
	elseif lsp == "nickel_ls" then
		nvim_lsp[lsp].setup {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "ncl", "nickel" },
		}

	else
		nvim_lsp[lsp].setup {
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			},
			capabilities = capabilities,
		}
	end
end
