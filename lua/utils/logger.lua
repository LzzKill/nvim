local M = {}

M.constant = require("utils.constant").notify_level
local is_nil = require("utils.utils").is_nil
-- Record a log
---@param level string | integer
---@param message string
---@param sender string?
---@param option table?
M.log = function(level, message, sender, option)
  ---@type string | integer
  local nlevel
  ---@type string
  local nmessage, tlevel
  if tlevel == "string" then
    nlevel = M.constant.notify_level[level]
  elseif tlevel == "number" then
    nlevel = level
  end
  if is_nil(level) then
    M.log("warning", "Varible level is nil", "utils.lua  function-log")
  elseif is_nil(message) then
    M.log("warning", "Varible message is nil", "utils.lua  function-log")
  end

  if is_nil(sender) then
    nmessage = message
  else
    nmessage = sender .. " : " .. message
  end
  vim.notify(nmessage, nlevel, option)
end

-- Record a log
---@param level string | integer
---@param message string
---@param title string
---@param sender string?
M.log_title = function(level, message, title, sender)
  M.log(level, message, sender, { title = title })
end

return M
