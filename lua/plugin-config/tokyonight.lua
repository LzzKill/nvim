require "tokyonight".setup {
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent"
  },
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark
    }
    hl.TelescopePromptNormal = {
      bg = prompt
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark
    }
  end
}

local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    }
})
