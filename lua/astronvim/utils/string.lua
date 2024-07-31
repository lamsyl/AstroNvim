local M = {}

function M.startswith(text, prefix)
    return text:find(prefix, 1, true) == 1
end

return M
