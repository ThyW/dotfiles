local capabilities = require 'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local home = os.getenv("HOME")

vim.cmd [[set tabstop=4]]
vim.cmd [[set shiftwidth=4]]
vim.cmd [[set softtabstop=4]]
vim.cmd [[set expandtab]]

local config = {
  cmd = { 'jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  on_attach = function(_, bufnr)
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
  end,
  capabilities = capabilities,
  settings = {
    java = {
      format = {
        enable = true,
        settings = {
          url = home .. "/.pb162_code_style",
        }
      },
      signatureHelp = {
        enable = true,
      },
      completion = {
        importOrder = {
          "java",
          "javax",
          "com",
          "org"
        }
      },
    }
  }
}


require('jdtls').start_or_attach(config)
