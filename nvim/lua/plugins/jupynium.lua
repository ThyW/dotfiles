local M = {
	"kiyoon/jupynium.nvim",
	build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
	config = function()
		require("jupynium").setup({
			auto_start_server = {
				enable = true,
				file_pattern = { "*.ju.*" },
			},
			auto_attach_to_server = {
				enable = true,
				file_pattern = { "*.ju.*" },
			},
			auto_start_sync = {
				enable = false,
				file_pattern = { "*.ju.*" },
			},
		})
	end,
}

return M
