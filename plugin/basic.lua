local config = require("fzz_config")
require("map")(config.N_maps)
require("nvimset")(config.Basic_configs)
vim.cmd("colorscheme catppuccin") -- Set colorscheme
