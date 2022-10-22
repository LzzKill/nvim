require('init')
require("plugins")
require("map")
require("LSP")
require("cfg")

require("plugin-config/bufferline")
require("plugin-config/lualine")
require("plugin-config/nvim-navic")
require("plugin-config/trouble")
require("plugin-config/neotree")
require("plugin-config/nvim-headband")
require("plugin-config/tokyonight")
require("plugin-config/alpha")
vim.cmd"autocmd VimEnter * Neotree"
vim.cmd"colorscheme tokyonight"

