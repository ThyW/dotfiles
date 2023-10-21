local mod = require("plugins.lsp")
local lspconfig = mod.lspconfig

require("mason").setup({})

require("mason-tool-installer").setup({
	ensure_installed = {
		"rust-analyzer",
		"clang-format",
		"pyright",
		"stylua",
		"prettier",
		"fourmolu",
		"bash-language-server",
		"black",
		"clangd",
		"jdtls",
		"lua-language-server",
		"rust-analyzer",
		"typst-lsp",
	},
	run_on_start = false,
})

require("mason-lspconfig").setup_handlers({
	function(server)
		lspconfig[server].setup({
			on_attach = mod.on_attach,
			capabilities = mod.capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end,
	["lua_ls"] = function()
		lspconfig["lua_ls"].setup({
			on_attach = mod.on_attach,
			flags = {
				debounce_text_changes = 150,
			},
			settings = {
				Lua = {
					-- this is still not supported
					format = {
						enable = true,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
					runtime = {
						version = "LuaJIT",
						path = mod.rtp,
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
					hints = { enable = true },
				},
			},
		})
	end,
	["rust_analyzer"] = function()
		lspconfig["rust_analyzer"].setup({
			on_attach = function(c, b)
				mod.on_attach(c, b)
			end,
			cmd = { "rustup", "run", "nightly", "rust-analyzer" },
			capabilities = mod.capabilities,
			server = {
				settings = {
					["rust-analyzer"] = {
						procMacro = {
							enable = true,
						},
						checkOnSave = {
							enable = true,
							command = "clippy",
						},
						completion = {
							postfix = {
								enable = false,
							},
							snippets = {
								enable = false,
								custom = {},
							},
						},
						imports = {
							prefix = "crate",
						},
					},
				},
			},
		})
	end,
	["pyright"] = function()
		lspconfig["pyright"].setup({
			on_attach = mod.on_attach,
			capabilities = mod.capabilities,
			cmd = { "pyright-langserver", "--stdio" },
			server = {
				settings = {
					Python = {
						formatting = {
							provider = "black",
							blackPath = "/home/zir/.local/bin/black",
						},
						analysis = {
							typeCheckingMode = "basic",
							inlayHints = {
								variableTypes = true,
								functionRetrunTypes = true,
							},
						},
					},
				},
			},
		})
	end,
})
