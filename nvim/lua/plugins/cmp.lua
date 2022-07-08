local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- load friendly snippets
local _ = require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup.filetype('rmd',
  { sources = cmp.config.sources({
    { name = "latex_symbols" },
    { name = "luasnip" },
    { name = "buffer" }
  })
  })

cmp.setup {
  mapping = {
    ["<c-u>"] = cmp.mapping.scroll_docs(-4),
    ["<c-d>"] = cmp.mapping.scroll_docs(4),
    ["<Cr>"] = cmp.mapping.confirm(),
    ["<c-space>"] = cmp.mapping.confirm(),
    ["<c-c>"] = cmp.mapping.close(),
    ["<c-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<c-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  cmdline = {
    sources = {
      { name = 'cmdline' }
    }
  },

  sources = {
    { name = "neorg" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "gh_issues" },
    { name = "path" },
    { name = "buffer" },
    { name = "crates" },
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require 'lspkind'.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        menu = {
          cmp_tabnine = "[]",
          buffer = "[]",
          nvim_lsp = "[]",
          nvim_lua = "[]",
          path = "[]",
          gh_issues = "[]",
        }
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      return kind
    end
  },

  experimental = {
    ghost_text = true
  },

  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
}
