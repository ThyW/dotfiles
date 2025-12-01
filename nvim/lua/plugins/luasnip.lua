local M = {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	branch = "master",
}

M.config = function()
	local ok, luasnip = pcall(require, "luasnip")
	if not ok then
		vim.notify("Could not load plugin: " .. M[1], vim.log.levels.ERROR)
		return
	end

	local ok, loader = pcall(require, "luasnip.loaders.from_vscode")
	if not ok then
		vim.notify("Could not find vscode loader for luasnip", vim.log.levels.ERROR)
		return
	end
	loader.lazy_load()
	local mk_snippet = luasnip.parser.parse_snippet
	local i = luasnip.insert_node
	local t = luasnip.text_node
	local f = luasnip.function_node
	local s = luasnip.snippet

	luasnip.filetype_extend("markdown", { "tex" })
	luasnip.filetype_extend("rmarkdown", { "tex" })
	luasnip.filetype_extend("javascript", { "html" })
	luasnip.filetype_extend("typescript", { "html" })
	luasnip.filetype_extend("typescriptreact", { "html" })

	luasnip.add_snippets("all", { mk_snippet("shbang", "#!/usr/bin/env $0") }, {})
	luasnip.add_snippets("rust", {
		mk_snippet("ils", "if let Some($1) = $2 {\n    $3\n}"),
		mk_snippet("pdbg", '#[cfg(debug_assertions)]\nprintln!("$1");'),
	}, {})

	local cb = function(args, _, _)
		return args[1]
	end

	luasnip.add_snippets(
		"xml",
		{ s({ trig = "elem" }, { t("<"), i(1), t(">"), i(2), t("</"), f(cb, 1), t(">") }, {}) },
		{}
	)
end

return M
