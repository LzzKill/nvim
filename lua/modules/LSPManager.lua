local logger = require("utils.logger")
local lspconfig = require("lspconfig")

local lspregister = {}

local on_attach_build = function(LSPOption)
  return function(client, bufnr)
    local opts = LSPOption and LSPOption.mapopt or { noremap = true, silent = true, buffer = bufnr }
    local map = vim.keymap.set

    map("n", "<space>ll", vim.lsp.buf.declaration, opts)
    map("n", "<space>ld", vim.lsp.buf.definition, opts)
    map("n", "<space>lk", vim.lsp.buf.hover, opts)
    map("n", "<space>gi", vim.lsp.buf.implementation, opts)
    map("n", "<leader>lk", vim.lsp.buf.signature_help, opts)
    map("n", "<leader>Wa", vim.lsp.buf.add_workspace_folder, opts)
    map("n", "<leader>Wr", vim.lsp.buf.remove_workspace_folder, opts)
    map("n", "<leader>WL", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    map("n", "<space>D", vim.lsp.buf.type_definition, opts)
    map("n", "<space>lr", vim.lsp.buf.rename, opts)
    map("n", "<leader>lc", vim.lsp.buf.code_action, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<space>lf", function() vim.lsp.buf.format { async = true } end, opts)
  end
end

---@return boolean
---@param name string
---@param option table?
local launch = function(name, option)
  if name == "" then return false end -- nil
  option = option or { on_attach = on_attach_build() }
  option.on_attach = option.on_attach or on_attach_build()
  lspconfig[name].setup(option)
  return true
end


---@return nil
---@param LSPName string
---@param LSPOption table?
return function(LSPName, LSPOption)
  if lspregister[LSPName] then
    return
  end
  lspregister[LSPName] = true
  vim.validate({ LSPName = { LSPName, "string" } })

  if launch(LSPName, LSPOption) then
    logger.log_title(logger.constant.info, "Load server: " .. LSPName .. " was loaded", "LSPManager")
    if not vim.lsp.get_active_clients()[LSPName] then
      vim.cmd("LspStart")
    end
  else
    logger.log_title(logger.constant.warning, LSPName .. " wasn't loaded", "LSPManager")
  end
end
