local M = {}

local fn = vim.fn

M.notify_level = {
  trace = 0,
  debug = 1,
  info = 2,
  warning = 3,
  error = 4
}

M.cmp_names = {
  nvim_lsp   = "LSP",
  treesitter = "TS",
  luasnip    = "Snip",
  buffer     = "Buf"
}

M.file_icons = {
  File          = "",
  Text          = "",
  Method        = "",
  Function      = "",
  Constructor   = "",
  Field         = "",
  Variable      = "",
  Class         = "",
  Interface     = "",
  Property      = "",
  Unit          = "塞",
  Value         = "",
  Enum          = "",
  Keyword       = "",
  Snippet       = "",
  Color         = "",
  Reference     = "",
  Folder        = "",
  EnumMember    = " ",
  Constant      = "",
  Struct        = " ",
  Event         = " ",
  Operator      = "",
  TypeParameter = ""
}


M.colorful = {
  Horizontal = "━",
  Portrait   = "┃",
  UpperLeft  = "┏",
  UpperRight = "┓",
  LowerLeft  = "┗",
  LowerRight = "┛",
  Colorful   = "#957CC6"
}

M.lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

return M
