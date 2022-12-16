-- indent_blankline
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
Plugins = {"lsp_signature", "gitsigns", "noice", "scrollbar.handlers.gitsigns", "todo-comments", "colorizer"}

for _, Plugin in ipairs(Plugins) do require(Plugin).setup() end
require"lspsaga"
-- Loader PluginConfigs

local Config = {"LineBuffer", "neotree", "nvim-treesitter", "nvim-autopairs", "tokyonight", "cmp", "nvim-autopairs", "Server", "null-ls", "nvim-telescope", "Comment"}

for _, Plugin in ipairs(Config) do require("plugin-config."..Plugin) end
