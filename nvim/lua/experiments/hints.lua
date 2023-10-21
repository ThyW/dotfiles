local text = "hello world"
local a = vim.api

local function virt_text()
	local ns = a.nvim_create_namespace("virt_text")
	-- a.nvim_put({"hello world"}, "", false, true)
	local hl_group = a.nvim_get_hl_id_by_name("Comment")
	local _ = a.nvim_buf_set_extmark(0, ns, 8 - 1, 12, {
		virt_text = { { text, hl_group } },
		virt_text_pos = "overlay",
		conceal = "a",
		virt_text_hide = true,
		strict = false,
	})
	a.nvim_buf_clear_namespace(0, ns, 0, -1)
end

virt_text()
