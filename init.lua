local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.runtimepath:prepend(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    "--depth 1",
    lazypath,
  })
end
local plugins = require("plugins")
require("lazy").setup(plugins, {
  ui = {
    border = "rounded",
  },
}
)

require("modules")
