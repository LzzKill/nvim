local M = {}

local filename = "utils.utils.lua"

local api = vim.api
local fn = vim.fn
-- local loop = vim.loop

local constant = require("utils.constant")

---@return boolean
---@param val any
-- This function return true if val is nil(include '{}', '', '[]')
M.is_nil = function(val)
  if val == nil then
    return true
  elseif val == "" then
    return true
  elseif next(val) == nil then
    return true
  end
  return false
end

---@param level string | integer
---@param message string
---@param sender string?
M.log = function(level, message, sender)
  ---@type string | integer
  local nlevel
  ---@type string
  local nmessage, tlevel
  if tlevel == "string" then
    nlevel = constant.notify_level[level]
  elseif tlevel == "number" then
    nlevel = level
  end
  if M.is_nil(level) then
    M.log("warning", "Varible level is nil", "utils.lua  function-log")
  elseif M.is_nil(message) then
    M.log("warning", "Varible message is nil", "utils.lua  function-log")
  end


  if M.is_nil(sender) then
    nmessage = message
  else
    nmessage = sender .. " : " .. message
  end
  vim.notify(nmessage, nlevel)
end


return M
