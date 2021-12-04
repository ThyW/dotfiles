local api = vim.api
local exec = vim.api.nvim_exec

local state = {
    win_id = nil,
    win_showed = false,
    buff = nil,
}

local function __get_cols(width)
    return (api.nvim_list_uis()[1].width / 2) - (width / 2)
end
local function __get_rows(height)
    return (api.nvim_list_uis()[1].height / 2) - (height / 2)
end

local function setup(table)
    local width = 200
    local height = 40
    local opts = {
    	win_opts = {
    	    relative = "editor",
	    width = width,
	    height = height,
	    col = __get_cols(width),
	    row = __get_rows(height),
	    style = "minimal",
	    anchor = "NW"
    	},
    }

    local setup_val = table or opts
    return setup_val
end

local function __ft_open()
    if state.win_id == nil then
    	return false
    else
	local buf = api.nvim_buf_is_valid(state.buff)
	return (buf == true) or false
    end
end

function ToggleFt()
    if __ft_open() == true then
    	api.nvim_win_close(state.win_id, true)
    	state.win_showed = false
    	state.win_id = nil
    else
	local buf = api.nvim_create_buf(false, true)
	api.nvim_buf_call(buf, function() exec([[term]], false)end)
	local term_buf = api.nvim_get_current_buf()
	api.nvim_buf_set_keymap(term_buf, "i", "<Esc>", "jj:q!<CR>", {noremap = true})

	local win = api.nvim_open_win(buf, 1, setup().win_opts)
	state.buff = buf
	state.win_id = win
	state.win_showed = true
    end
end

exec("nnoremap <leader>T :lua ToggleFt()<CR>i", false)
