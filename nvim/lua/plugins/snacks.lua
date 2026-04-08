local opts = {
	animate = { enabled = false },
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	dashboard = {
		enabled = true,
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			{
				pane = 1,
				icon = " ",
				title = "Git Status",
				section = "terminal",
				enabled = function()
					return Snacks.git.get_root() ~= nil
				end,
				cmd = "git status --short --branch --renames",
				height = 5,
				padding = 1,
				ttl = 5 * 60,
				indent = 3,
			},
		},
	},
	debug = { enabled = false },
	dim = { enabled = true },
	explorer = { enabled = false },
	gh = { enabled = false },
	git = { enabled = false },
	gitbrowse = { enabled = false },
	image = { enabled = false },
	indent = { enabled = true },
	input = { enabled = true },
	keymap = { enabled = false },
	layout = { enabled = true },
	lazygit = { enabled = false }, -- could possibly be enabled later
	notifier = { enabled = true },
	notify = { enabled = true },
	picker = { enabled = true, layout = {
		preset = "dropdown",
	} },
	profiler = { enabled = false },
	quickfile = { enabled = true },
	rename = { enabled = true },
	scope = { enabled = true },
	scratch = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = false },
	terminal = { enabled = false },
	toggle = { enabled = false },
	util = { enabled = false },
	win = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
}
local keys = {
	{
		"<leader>bD",
		function()
			Snacks.bufdelete.other()
		end,
		desc = "delete all buffers except the current one",
	},
	{
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "find files",
	},
	{
		"<leader>fl",
		function()
			Snacks.picker.lines()
		end,
		desc = "find lines",
	},
	{
		"<leader>fb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "find buffers",
	},
	{
		"<leader>fg",
		function()
			Snacks.picker.git_files()
		end,
		desc = "find git files",
	},
	{
		"<leader>fh",
		function()
			Snacks.picker.command_history({ layout = { preset = "ivy" } })
		end,
		desc = "find in command history",
	},
	{
		"<leader>fq",
		function()
			Snacks.picker.qflist()
		end,
		desc = "find in quickfix list",
	},
	{
		"<leader>fL",
		function()
			Snacks.picker.grep()
		end,
		desc = "find using live grep",
	},
	{
		"<leader>fd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "find in all diagnostics",
	},
	{
		"<leader>fp",
		function()
			Snacks.picker.pickers()
		end,
		desc = "find in pickers",
	},
	{
		"<leader>fH",
		function()
			Snacks.picker.help({ layout = { preset = "ivy" } })
		end,
		desc = "find in help",
	},
	{
		"<leader>fT",
		function()
			Snacks.picker.todo_comments()
		end,
		desc = "find TODO comments",
	},
	{
		"<leader>fM",
		function()
			Snacks.picker.man()
		end,
		desc = "find a man page",
	},
	{
		"<leader>ft",
		function()
			Snacks.picker.treesitter()
		end,
		desc = "find symbols using treesitter",
	},
	{
		"<leader>fh",
		function()
			Snacks.picker.command_history({ layout = { preset = "ivy" } })
		end,
		desc = "find in command history",
	},
	{
		"<leader>oz",
		function()
			Snacks.zen.zen()
		end,
		desc = "toggle zen mode",
	},
	{
		"<leader>oZ",
		function()
			Snacks.zen.zoom()
		end,
		desc = "toggle zen zoom",
	},
	{
		"<leader>.",
		function()
			Snacks.scratch()
		end,
		desc = "Toggle scratch buffer",
	},
	{
		"<leader>S",
		function()
			Snacks.scratch.select()
		end,
		desc = "Select Scratch Buffer",
	},
}

local init = function()
	vim.api.nvim_create_autocmd("LspProgress", {
		---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
		callback = function(ev)
			local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
			vim.notify(vim.lsp.status(), "info", {
				id = "lsp_progress",
				title = "LSP Progress",
				opts = function(notif)
					notif.icon = ev.data.params.value.kind == "end" and " "
						or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
				end,
			})
		end,
	})
end
local M = {
	src = "folke/snacks.nvim",
	config = function()
		init()
		require("snacks").setup(opts)
		for _, key in ipairs(keys) do
			local opt = {}
			if key.desc then
				opt = { desc = key.desc }
			end
			vim.keymap.set("n", key[1], key[2], opt)
		end
	end,
}

return M
