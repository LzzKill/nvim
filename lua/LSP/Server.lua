--LSP
local navic = require("nvim-navic")

require "lspconfig".clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end,
}

require "lspconfig".luau_lsp.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
} --lua

require "lspconfig".cssls.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
} --css

local capabilities = vim.lsp.protocol.make_client_capabilities() --css
capabilities.textDocument.completion.completionItem.snippetSupport = true --css
require "lspconfig".pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {"W391"},
                    maxLineLength = 100
                }
            }
        }
    }
}

require "lspconfig".jedi_language_server.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
} --Python

require "lspconfig".html.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end,
    --HTML
    capabilities = capabilities
}

require "lspconfig".tsserver.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
} --TypeScript

