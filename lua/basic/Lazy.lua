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

require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
  },
}
)
