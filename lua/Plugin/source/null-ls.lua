local null_ls = require("null-ls")
local sources = {
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.lua_format,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
  on_init = function(new_client, _)
    new_client.offset_encoding = 'utf-8'
  end,
  sources = sources
})
