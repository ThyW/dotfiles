local err, ht = pcall(require, "haskell-tools")
local lsp = require("plugins.lsp")

if not err then
	print("error loading haskell tools!")
	return
end

ht.setup({
	hls = {
		on_attach = lsp.on_attach,
	},
})
