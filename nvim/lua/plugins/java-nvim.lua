local M = {
	src = "nvim-java/nvim-java",
	config = function()
		require("java").setup()
		vim.lsp.enable("jdtls")
	end,
	dependencies = {
		{ src = "MunifTanjim/nui.nvim", version = "main" },
		{ src = "mfussenegger/nvim-dap" },
		{
			src = "JavaHello/spring-boot.nvim",
			version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
		},
	},
}

return M
