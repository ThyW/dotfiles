local ls = require("luasnip")
local s = ls.parser.parse_snippet

ls.filetype_extend("markdown", { "tex" })
ls.filetype_extend("rmarkdown", { "tex" })

ls.add_snippets("all", { s("shbang", "#!/usr/bin/env $0") }, {})
ls.add_snippets("rust",
  { s("ils", "if let Some($1) = $2 {\n    $3\n}"), s("pdbg", "#[cfg(debug_assertions)]\nprintln!(\"$1\");") }, {})
