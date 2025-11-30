local M = {
	"williamboman/mason.nvim",
	config = function()
		require("plugins.mason")
	end,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
}

M.config = function()
	local lsp_settings = require("..plugins.extra.lsp")

	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {
			"basedpyright",
			"bashls",
			"clangd",
			"lua_ls",
			"rust_analyzer",
			"zls",
			"harper_ls",
			"hls",
		},
		automatic_enable = {
			"bashls",
			"lua_ls",
			"zls",
			"rust_analyzer",
		},
	})

	vim.lsp.config("*", {
		on_attach = lsp_settings.on_attach,
		capabilities = lsp_settings.capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
	vim.lsp.config("harper_ls", {
		filetypes = {
			"c",
			"cpp",
			"cs",
			"gitcommit",
			"go",
			"html",
			"java",
			"javascript",
			"lua",
			"markdown",
			"nix",
			"python",
			"ruby",
			"rust",
			"swift",
			"toml",
			"typescript",
			"typescriptreact",
			"haskell",
			"cmake",
			-- "typst",
			"php",
			"dart",
		},
		settings = {
			["harper-ls"] = {
				userDictPath = "",
				fileDictPath = "",
				linters = {
					SpellCheck = true,
					SpelledNumbers = false,
					AnA = true,
					SentenceCapitalization = true,
					UnclosedQuotes = true,
					WrongQuotes = false,
					LongSentences = true,
					RepeatedWords = true,
					Spaces = true,
					Matcher = true,
					CorrectNumberSuffix = true,
				},
				codeActions = {
					ForceStable = false,
				},
				markdown = {
					IgnoreLinkTitle = false,
				},
				diagnosticSeverity = "hint",
				isolateEnglish = false,
				dialect = "American",
			},
		},
	})
	vim.lsp.config("lua_ls", {
		on_attach = lsp_settings.on_attach,
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
					path = lsp_settings.rtp,
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
				hint = { enable = true },
			},
		},
	})
	vim.lsp.config("rust_analyzer", {
		on_attach = lsp_settings.on_attach,
		cmd = { "rustup", "run", "nightly", "rust-analyzer" },
		capabilities = lsp_settings.capabilities,
		server = {
			settings = {
				-- yes
				Rust = {
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
	vim.lsp.config("pyright", {
		on_attach = lsp_settings.on_attach,
		capabilities = lsp_settings.capabilities,
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
end

return M
