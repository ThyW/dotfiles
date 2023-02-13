return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {'nvim-treesitter/playground', 'nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter/nvim-treesitter-refactor'},
  build = ":TSUpdate",
  config = function ()
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

    parser_configs.norg = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
      },
    }

    parser_configs.norg_meta = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
      },
    }

    parser_configs.norg_table = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
      },
    }

    require('nvim-treesitter.configs').setup {
      ensure_installed = { "rust", "c", "cpp", "python", "php", "css", "html", "norg", "norg_meta", "norg_table", "latex", "bash", "lua", "vim", "haskell" },
      highlight = {
        enable = true,
      },
      autopairs = { enable = true },
      incremental_selection = {
        enable = true,
        kaymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        }
      },
      refactor = {
        highlight_definitions = {
          enable = true
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          }
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>aa"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          }
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          }
        }
      }
    }
  end
}
