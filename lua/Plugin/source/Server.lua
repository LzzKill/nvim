local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local maps = {
    { "<space>l", vim.lsp.buf.declaration, opts },
    { "gd", vim.lsp.buf.definition, opts },
    { "K", vim.lsp.buf.hover, opts },
    { "gi", vim.lsp.buf.implementation, opts },
    { "<C-k>", vim.lsp.buf.signature_help, opts },
    { "<space>Wa", vim.lsp.buf.add_workspace_folder, opts },
    { "<space>Wr", vim.lsp.buf.remove_workspace_folder, opts },
    { "<space>WL", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
      opts
    },
    { "<space>D", vim.lsp.buf.type_definition, opts },
    { "<space>lr", vim.lsp.buf.rename, opts },
    { "<leader>lc", vim.lsp.buf.code_action, opts },
    { "gr", vim.lsp.buf.references, opts },
    { "<space>lf", function()
      vim.lsp.buf.format { async = true }
    end,
      opts
    },
  }
  require("map")(maps)
end
return on_attach
