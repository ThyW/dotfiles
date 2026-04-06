local M = {}

local function normalize_src(src)
	if src:match("^[a-z]+://") then
		return src
	end
	return "https://github.com/" .. src:gsub("^/", "")
end

M._configs = {}
M._specs = {}

M.plugin = function(path)
	local spec = require(path)
	if spec.dependencies then
		for _, dep in ipairs(spec.dependencies) do
			table.insert(M._specs, { src = normalize_src(dep.src), version = dep.version })
		end
	end
	table.insert(M._specs, vim.tbl_extend("force", M._specs, { src = normalize_src(spec.src), version = spec.version }))
	if spec.config then
		table.insert(M._configs, spec.config)
	end
end

M.load = function()
	vim.pack.add(M._specs)
	for _, config in ipairs(M._configs) do
		config()
	end
end

return M
