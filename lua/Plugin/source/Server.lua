local on_attach = function(client, bufnr)
  require "lsp_signature".on_attach(signature_setup, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local maps = {
    { "gD", vim.lsp.buf.declaration, bufopts },
    { "gd", vim.lsp.buf.definition, bufopts },
    { "K", ":Lspsaga hover_doc", bufopts },
    { "gi", vim.lsp.buf.implementation, bufopts },
    { "<C-k>", vim.lsp.buf.signature_help, bufopts },
    { "<space>Wa", vim.lsp.buf.add_workspace_folder, bufopts },
    { "<space>Wr", vim.lsp.buf.remove_workspace_folder, bufopts },
    { "<space>WL", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
      bufopts
    },
    { "<space>D", vim.lsp.buf.type_definition, bufopts },
    { "<leader>lr", ":Lspsaga rename", bufopts },
    { "<leader>la", ":Lspsaga code_action", bufopts },
    { "gr", vim.lsp.buf.references, bufopts },
    { "<space><leader>", function()
      vim.lsp.buf.format { async = true }
    end,
      bufopts
    },
  }
  require("map")(maps)
end
return on_attach
