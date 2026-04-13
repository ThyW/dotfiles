local M = {}

local function normalize_src(src)
	if src:match("^[a-z]+://") then
		return src
	end
	return "https://github.com/" .. src:gsub("^/", "")
end

-- Try to load a plugin spec from a file.
local function load_spec(path)
	local ok, spec = pcall(require, path)
	if not ok then
		return nil
	end
	return spec
end

local function add_spec(spec)
	if spec.dependencies then
		for _, dep in ipairs(spec.dependencies) do
			table.insert(M._specs, { src = normalize_src(dep.src), version = dep.version })
		end
	end
	if spec.src then
		table.insert(
			M._specs,
			vim.tbl_extend("force", M._specs, { src = normalize_src(spec.src), version = spec.version })
		)
	end
end

local function pack_add_spec(spec)
	if spec.dependencies then
		for _, dep in ipairs(spec.dependencies) do
			vim.pack.add({ src = normalize_src(dep.src), version = dep.version })
		end
	end
	if spec.src then
		vim.pack.add({ { src = normalize_src(spec.src), version = spec.version } })
	end
end

-- If a spec contains the `ft` field, it sets the plugin to load lazily only for the given filetype.
local function register_filetype(spec)
	if not spec.config then
		vim.notify(string.format("No config for plugin %s", spec.src))
		return
	end
	local ft = spec.ft
	if type(spec.ft) == "table" then
		ft = spec.ft[1]
	end
	local gid = vim.api.nvim_create_augroup(spec.src .. "." .. ft, {
		clear = false,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = spec.ft,
		callback = function()
			pack_add_spec(spec)
			spec.config()
		end,
		group = gid,
	})
end

M._configs = {}
M._specs = {}

M.plugin = function(path)
	local spec = load_spec(path)
	if spec == nil then
		return
	end
	if spec.ft then
		register_filetype(spec)
	else
		add_spec(spec)
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
