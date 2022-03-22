local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- load friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()

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

nvim_cmp.setup{
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
	{name = "luasnip"},
	{name = "nvim_lua"},
	{name = "nvim_lsp"},
	{name = "gh_issues"},
	{name = "path"},
	{name = "buffer"}
	-- {name = "cmp_tabnine"},
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
