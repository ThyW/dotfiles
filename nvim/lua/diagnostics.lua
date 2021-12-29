M = {}

local d = vim.diagnostic
local api = vim.api
local fn = vim.fn

function M.line_diagnostics()
    -- get the line number of the cursor
    local line = api.nvim_win_get_cursor(0)[1] - 1
    local bnr = fn.bufnr("%")
    local diagnostics = d.get(0, {lnum = line})
    local diags = {}
    for _, diagnostic in ipairs(diagnostics) do
    	table.insert(diags, 0, diagnostic)
    end

    local opts = {
    	virtual_text = false,
    	bufnr = bnr,
    	diagnostics = diags,
    	scope = "line",
    	severity_sort = true,
    }

    d.open_float(opts)
end

function M.location_list()
    -- use default settings -> h: vim.diagnostic.setloclist()
    d.setloclist({})
end

function M.quickfix_list()
    local opts = {
    	title = "Quickfix list:"
    }
    d.setqflist(opts)
end

function M.goto_prev()
    d.goto_prev({})
end
function M.goto_next()
    d.goto_prev({})
end

return M
