local a = vim.api
local M = {}

local defaults = {
    -- FIXME and fixme and FiXMe has the same meaning
    ignore_case = true,
    -- words to look for when searching
    words = {"fixme", "todo", "note", "warn", "warning", "fix"},
    -- FIXMEE has higher priority in seraching than FIXME
    priority_serach = true,
}

function M.setup(table)
    if table then
    	M.config = table
    else
    	M.config = defaults
    end
end

function M.search_buffer()
    -- get lines for currnet buffer
    local buffer_lines = a.nvim_buf_get_lines(0, 0, -1, false)
    -- check, if conversion to lower case should be executed
    local words = {}
    if M.config.ignore_case then
	for _, each in ipairs(M.config.words) do
	    table.insert(words, string.lower(each))
	end
	M._print_table(words)
    end

    for index, line in ipairs(buffer_lines) do
    	-- do nothing
    	local a = 0
    end
end

function M.create_list(search_results)
end

function M.show_window(list)
end

function M.show_float(list)
end

function M._print_table(table)
    for i, each in ipairs(table) do print(each) end
end

-- testing
M.setup()
M.search_buffer()

return M


