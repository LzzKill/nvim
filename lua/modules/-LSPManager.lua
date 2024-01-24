local logger = require("utils.logger")
if not _G.loader_lazy then
  require("basic.Lazy")
end

local lspconfig = require("lspconfig")
local LSPRegistred = {}

---@return function
---@param LSPOption table?
local on_attach_build = function(LSPOption)
  local function on_attach_r(client, bufnr)
    local opts
    if LSPOption == nil then
      opts = { noremap = true, silent = true, buffer = bufnr }
    else
      opts = LSPOption.mapopt or { noremap = true, silent = true, buffer = bufnr }
    end
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

  return on_attach_r
end

local buffer_add = function(LSPName, buffer)
  buffer = buffer or vim.api.nvim_get_current_buf()
  lspconfig[LSPName].manager.try_add_wrapper(buffer)
end

---@param name string
---@param option table?
---@return boolean
local launch = function(name, option)
  if name == "" then return false end -- nil
  option = option or { on_attach = on_attach_build() }
  lspconfig[name].setup(option)
  buffer_add(name)
  -- lspconfig[name].manager.try_add_wrapper(vim.api.nvim_get_current_buf())
  return true
end

---@return nil
---@param LSPName string
---@param LSPOption table?
return function(LSPName, LSPOption)
  if LSPRegistred[LSPName] then return end
  LSPRegistred[LSPName] = true
  vim.validate({ name = { LSPName, "string" } })
  if launch(LSPName, LSPOption) then
    logger.log_title(logger.constant.info, "Load server: " .. LSPName .. " was loaded", "LSPManger")
  else
    logger.log_title(logger.constant.warning, LSPName .. "wasn't loader", "LSPManager")
  end
end
