local M = {}

function M.get_keys(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

return M
