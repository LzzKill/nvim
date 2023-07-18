local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local map = vim.keymap.set
  map("n", "<space>l", vim.lsp.buf.declaration, opts)
  map("n", "<space>ld", vim.lsp.buf.definition, opts)
  map("n", "<space>lk", vim.lsp.buf.hover, opts)
  map("n", "<space>gi", vim.lsp.buf.implementation, opts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  map("n", "<leader>Wa", vim.lsp.buf.add_workspace_folder, opts)
  map("n", "<leader>Wr", vim.lsp.buf.remove_workspace_folder, opts)
  map("n", "<leader>WL", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  map("n", "<space>D", vim.lsp.buf.type_definition, opts)
  map("n", "<space>lr", vim.lsp.buf.rename, opts)
  map("n", "<leader>lc", vim.lsp.buf.code_action, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "<space>lf", function() vim.lsp.buf.format { async = true } end, opts)
end

local lspconfig = require("lspconfig")
local LSP = { "clangd", "cssls", "pyright", "html", "lua_ls" }
for _, lsp in ipairs(LSP) do
  lspconfig[lsp].setup(
    {
      on_attach = on_attach()
    }
  )
end
