local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
  },
}
)

require("modules")
