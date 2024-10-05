if _G.loader_lazy then
  return
end
local lazypath = require("utils.constant").lazypath
vim.opt.runtimepath:prepend(lazypath)
_G.loadlazy = true
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

require("lazy").setup("limit.plugins", {
  ui = {
    border = "rounded",
  },
}
)

_G.loader_lazy = true
