local ls = require("luasnip")
local s = ls.parser.parse_snippet

ls.snippets = {
    rust = {
	s("ils", "if let Some($1) = $2 {\n    $3\n}"),
    },
    python = {
    	s("shbang", "#!/usr/bin/env python3")
    }
}
