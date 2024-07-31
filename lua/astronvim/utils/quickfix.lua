local M = {}

local tbl = require "astronvim.utils.table"

---@return table # array of unique filenames in the quickfix list
function M.get_qf_files()
  local qf_files = {}
  for _, d in ipairs(vim.fn.getqflist()) do
    local filename = vim.fn.bufname(d.bufnr)
    qf_files[filename] = 1
  end
  return tbl.get_keys(qf_files)
end

return M
