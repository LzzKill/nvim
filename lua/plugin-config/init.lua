-- indent_blankline
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require"indent_blankline".setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true
}

require"noice".setup {
  config = {lsp = {signature = {enable = false}}},
  views = {
    cmdline_popup = {
      position = {row = 5, col = "50%"},
      size = {width = 50, height = "auto"}
    },
    popupmenu = {
      relative = "editor",
      position = {row = 8, col = "50%"},
      size = {width = 60, height = 10},
      border = {style = "rounded", padding = {0, 1}},
      win_options = {
        winhighlight = {
          Normal = "Normal",
          FloatBorder = "DiagnosticInfo"
        }
      }
    }
  }
}
Plugins = {
  "lsp_signature", "gitsigns","scrollbar.handlers.gitsigns",
  "todo-comments", "colorizer"
}

for _, Plugin in ipairs(Plugins) do require(Plugin).setup() end
require "lspsaga"
-- Loader PluginConfigs
local Config = {
  "LineBuffer", "neotree", "nvim-treesitter", "nvim-autopairs", "tokyonight",
  "cmp", "nvim-autopairs", "Server", "null-ls", "nvim-telescope", "Comment"
}
for _, Plugin in ipairs(Config) do require("plugin-config." .. Plugin) end
