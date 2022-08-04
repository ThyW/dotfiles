require "neorg".setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.esupports.metagen"] = { config = {
      type = "auto",
    } },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Leader>i",
        hook = function(keybinds)
          keybinds.map("norg", "n", "<leader>zn", "<cmd>Neorg zettel new")
          keybinds.map("norg", "n", "<leader>ze", "<cmd>Neorg zettel explore")
          keybinds.map("norg", "n", "<leader>zb", "<cmd>Neorg zettel backlinks float")
        end
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
          my_workspace = "~/neorg",
          dashboard = "~/dashboard"
        }
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "dashboard",
        default_lists = {
          inbox = "inbox.norg",
        },
        syntax = {
          context = "#contexts",
          start = "#time.start",
          due = "#time.due",
          waiting = "#waiting.for",
        }
      }
    },
    ["core.export"] = { config = {} },
    ["core.export.markdown"] = { config = { extensions = "all" } },
    ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
  },
  requires = "nvim-lua/plenary.nvim"
}
