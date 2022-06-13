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
    format = require 'lspkind'.cmp_format {
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
    ghost_text = true
  },
}
