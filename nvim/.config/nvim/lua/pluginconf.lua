local g = vim.g

-- ===Nvim-Autopair===
require'nvim-autopairs'.setup{
    check_ts = true,
}

-- === bufferline.nvim ===
require'bufferline'.setup{
    options = {
    	numbers = "buffer_id",
	close_command = "bdelete! %d",
	left_mouse_command = "buffer %d",
	diagnostics = "nvim_lsp",
	show_buffer_icons = true,
	always_show_bufferline = true,
	separator_style = "slant",
	offsets = {{filetype = "NvimTree"}}
    }
}

-- ===Nvim-Tree===
-- show indent markers when folders are open
g.nvim_tree_indent_markers = 1
-- add a slash to folder names
g.nvim_tree_addtrailing = 1

local nvim_tree_callback = require'nvim-tree.config'.nvim_tree_callback

local nvim_tree_list = {
    {key = "+", cb = nvim_tree_callback("cd")}
}
require'nvim-tree'.setup {
    -- this is false by default:
    diagnostics = {
	enable = true,
    },
    view = {
    	width = 30,
    	height = 30,
    	auto_resize = true,
	mappings = {
	    list = nvim_tree_list
	}
    },
    auto_close = true,
}
-- ===Treesitter===
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = {"rust", "c", "cpp", "python", "php", "css", "html", "norg", "latex", "bash", "lua", "vim"},
    highlight = {
	enable = true,
    },
    autopairs = {enable = true},
    incremental_selection = {
    	enable = true,
    	kaymaps = {
	    init_selection = "gnn",
	    node_incremental = "grn",
	    scope_incremental = "grc",
	    node_decremental = "grm",
    	}
    }
}
-- === Rust Tools ===
local rust_tools_opts = {
    tools = { -- rust-tools options
    autoSetHints = true,
    hover_with_actions = true,
    runnables = {
	use_telescope = false -- don't have telescope
    },

    debuggables = {
	use_telescope = false -- don't have telescope
    },

    inlay_hints = {
	only_current_line = true,
	only_current_line_autocmd = "CursorHold",
	show_parameter_hints = true,
	parameter_hints_prefix = "<- ",
	other_hints_prefix = "=> ",
	max_len_align = false,
	max_len_align_padding = 1,
	right_align = false,
	right_align_padding = 7,
	highlight = "Comment",
    },

    hover_actions = {
	border = {
	    {"╭", "FloatBorder"}, {"─", "FloatBorder"},
	    {"╮", "FloatBorder"}, {"│", "FloatBorder"},
	    {"╯", "FloatBorder"}, {"─", "FloatBorder"},
	    {"╰", "FloatBorder"}, {"│", "FloatBorder"}
	},
	auto_focus = false
    },
    crate_graph = {
	backend = "x11",
	output = nil,
	full = true,
    }
},
server = {} -- rust-analyer options
}

require('rust-tools').setup(rust_tools_opts)
-- ===nvim_cmp===
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local tabnine = require'cmp_tabnine.config'
tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
})

local nvim_cmp = require'cmp'
local luasnip = require'luasnip'

nvim_cmp.setup {
    mapping = {
	["<c-u>"] = nvim_cmp.mapping.scroll_docs(-4),
	["<c-d>"] = nvim_cmp.mapping.scroll_docs(4),
	["<Cr>"] = nvim_cmp.mapping.confirm(),
	["<c-space>"] = nvim_cmp.mapping.confirm(),
	["<c-e>"] = nvim_cmp.mapping.close(),
	["<c-n>"] = nvim_cmp.mapping(function(fallback)
	    if nvim_cmp.visible() then
		nvim_cmp.select_next_item()
	    elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	    elseif has_words_before() then
		nvim_cmp.complete()
	    else
		fallback()
	    end
	end, { "i", "s" }),

	["<c-p>"] = nvim_cmp.mapping(function(fallback)
	    if nvim_cmp.visible() then
		nvim_cmp.select_prev_item()
	    elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	    else
		fallback()
	    end
	end, { "i", "s" }),
    },

    sources = {
	{name = "neorg"},
	{name = "cmp_tabnine"},
	{name = "luasnip"},
	{name = "nvim_lua"},
	{name = "nvim_lsp"},
	{name = "gh_issues"},
	{name = "path"},
	{name = "buffer"}
    },

    snippet = {
	expand = function(args)
	    luasnip.lsp_expand(args.body)
	end,
    },

    formatting = {
	format = require'lspkind'.cmp_format{
	    with_text = true,
	    menu = {
	    	cmp_tabnine = "[TAB]",
		buffer = "[BUF]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[LUA]",
		path = "[PATH]",
		gh_issues = "[Issue]",
	    }
	}
    },

    experimental = {
	native_menu = false,
	ghost_text = true
    },

}


-- ===Lsp Config===
local nvim_lsp = require'lspconfig'

local on_attach = function(bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

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
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>af', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local servers = { 'pyright', 'rust_analyzer', 'phpactor', 'html', 'clangd'}

-- lua setup
local sumneko_path = '/usr/bin/lua-language-server'
local rtp = vim.split(package.path, ';')

table.insert(rtp ,"lua/?.lua")
table.insert(rtp, "lua/?/init.lua")


nvim_lsp['sumneko_lua']. setup {
    on_attach = on_attach,
    flags = {
	debounce_text_changes = 150,
    },
    cmd = {sumneko_path};
    settings = {
	Lua = {
	    runtime = {
		version = 'LuaJIT',
		path = rtp,
	    },
	    diagnostics = {
		globals = {'vim'},
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
    local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    nvim_lsp[lsp].setup {
	on_attach = on_attach,
	flags = {
	    debounce_text_changes = 150,
	},
	capabilities = capabilities,
    }
end

-- === Neorg ===
require"neorg".setup{
    load = {
	["core.defaults"] = {},
	["core.keybinds"] = {
	    config = {
	    	default_keybinds = true,
	    	neorg_leader = "<Leader>i"
	    }
	},
	["core.norg.completion"] = {
	    config = {
		engine = "nvim-cmp"
	    }
	},
	["core.norg.concealer"] = {},
	["core.norg.dirman"] = {
	    config = {
	    	workspaces = {
	    	    my_workspace = "~/neorg"
		}
	    }
	},
    },
    logger = {
	-- Should print the output to neovim while running
	  use_console = true,

	  -- Should highlighting be used in console (using echohl)
	  highlights = true,

	  -- Should write to a file
	  use_file = true,

	  -- Any messages above this level will be logged.
	  level = "warn",

	  -- Level configuration
	  modes = {
		{ name = "trace", hl = "Comment", },
		{ name = "debug", hl = "Comment", },
		{ name = "info",  hl = "None", },
		{ name = "warn",  hl = "WarningMsg", },
		{ name = "error", hl = "ErrorMsg", },
		{ name = "fatal", hl = "ErrorMsg", },
	  },

	  -- Can limit the number of decimals displayed for floats
	  float_precision = 0.01,
    },
    requires = "nvim-lua/plenary.nvim"
}
