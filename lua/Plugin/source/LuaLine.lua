local noice = require "noice"
require"lualine".setup{{
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "|",
    section_separators = {left = "", right = ""}
  },
  sections = {
    lualine_a = {{"mode", separator = {left = ""}, right_padding = 2}},
    lualine_b = {"filename", "branch"},
    lualine_c = {"fileformat"},
    lualine_x = {
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_y = {"filetype", "progress"},
    lualine_z = {
      {"location", separator = {right = ""}, left_padding = 2}
    }
  }
}}
