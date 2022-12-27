local noice = require "noice"
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "|",
  },
  sections = {
    lualine_b = { "filename", "branch" },
    lualine_c = { "fileformat" },
    lualine_x = {
      {
        noice.api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "#ff9e64" },
      },
      {
        noice.api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_y = { "filetype", "progress" },
    lualine_z = {
    }
  }
})
