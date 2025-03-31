local M = {
	"kiyoon/jupynium.nvim",
	build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
	config = function()
		require("jupynium").setup({
			auto_start_server = {
				enable = true,
				file_pattern = { "*.ju.*" },
			},
			auto_start_sync = {
				enable = true,
				file_pattern = { "*.ju.*" },
			},
		})
	end,
}

return M
