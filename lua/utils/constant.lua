local M = {}

local fn = vim.fn

M.notify_level = {
  trace = 0,
  debug = 1,
  info = 2,
  warning = 3,
  error = 4
}

M.lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

return M
