local M = {}

M.source_names = {
  nvim_lsp = "LSP",
  treesitter = "TS",
  luasnip = "Snip",
  buffer = "Buf"
}
M.source_icons = {
  File = "",
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Property = "",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  Reference = "",
  Folder = "",
  EnumMember = " ",
  Constant = "",
  Struct = " ",
  Event = " ",
  Operator = "",
  TypeParameter = ""
}

return M
