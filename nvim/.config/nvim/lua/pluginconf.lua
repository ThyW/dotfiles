local g = vim.g

-- ===Nvim-Autopair===
require'nvim-autopairs'.setup{
    check_ts = true,
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
    	mappings = {
    	    list = nvim_tree_list
    	}
    }
}

-- ===Treesitter===
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
    	enable = true,
    },
    autopairs = {enable = true}
}

-- autostart only on certain filetypes
-- vim.cmd([[autocmd FileType rust,python,c,bash,vim,lua COQnow --shut-up]])

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

local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
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

local servers = { 'pyright', 'rust_analyzer', 'phpactor', 'html', 'ccls' }

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
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
	debounce_text_changes = 150,
      }
    }
end

