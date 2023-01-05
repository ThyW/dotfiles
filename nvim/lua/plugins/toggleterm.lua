require("toggleterm").setup {
  size = function (term)
    if term.direction == "vertical" then
      return vim.o.columns * 0.4
    else
      return 20
    end
  end,
  shade_terminals = false,
  float_opts = {
    border = "curved",
  },
  insert_mapping = false,
}
