local M = {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	branch = "master",
	lazy = false,
}

M.config = function()
	local luasnip = require("luasnip")
	require("luasnip.loaders.from_vscode").lazy_load()
	local mk_snippet = luasnip.parser.parse_snippet

	luasnip.filetype_extend("markdown", { "tex" })
	luasnip.filetype_extend("rmarkdown", { "tex" })

	luasnip.add_snippets("all", { mk_snippet("shbang", "#!/usr/bin/env $0") }, {})
	luasnip.add_snippets("rust", {
		mk_snippet("ils", "if let Some($1) = $2 {\n    $3\n}"),
		mk_snippet("pdbg", '#[cfg(debug_assertions)]\nprintln!("$1");'),
	}, {})
end

return M
