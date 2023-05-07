require "nvim-treesitter.configs".setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  rainbow = {
    enable = true,
    query = 'rainbow-parens',
    strategy = require('ts-rainbow').strategy.global,
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
})
