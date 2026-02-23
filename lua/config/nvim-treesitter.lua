require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "lua", "cpp", "markdown", "markdown_inline" },

  sync_install = false,
  auto_install = true,

  ignore_install = { "all" },
  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    additional_vim_regex_highlighting = false,
  }
})
