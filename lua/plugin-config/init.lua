-- indent_blankline
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require "indent_blankline".setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true
}

require "nvim-autopairs".setup {
  enable_check_bracket_line = false
}
Plugins = {
  "lsp_signature", "gitsigns","scrollbar.handlers.gitsigns",
  "todo-comments", "colorizer"
}

for _, Plugin in ipairs(Plugins) do require(Plugin).setup() end
require "lspsaga"
-- Loader PluginConfigs
local Config = {
  "LineBuffer", "neotree", "nvim-treesitter", "tokyonight",
  "cmp", "Server", "null-ls", "nvim-telescope", "Comment", "noice"
}
for _, Plugin in ipairs(Config) do require("plugin-config." .. Plugin) end
