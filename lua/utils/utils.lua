local M = {}

local api = vim.api
local fn = vim.fn
-- local loop = vim.loop

---@return boolean
---@param val any
-- This function return true if val is nil(include '{}', '', '[]')
M.is_nil = function(val)
  if val == nil then
    return true
  elseif val == "" then
    return true
  elseif type(val) == "table" and next(val) == nil then
    return true
  end
  return false
end


return M
