local capabilities = vim.lsp.protocol.make_client_capabilities() --css
capabilities.textDocument.completion.completionItem.snippetSupport = true --css

-- Local LSP
require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)
    end
}

require("lspconfig").cssls.setup {
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)
    end
} --css

require("lspconfig").pylsp.setup {
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

require("lspconfig").jedi_language_server.setup {
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)
    end
}

require("lspconfig").quick_lint_js.setup {
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)
    end
}
require("lspconfig").html.setup {
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)
    end,
    capabilities = capabilities
}
require'lspconfig'.sumneko_lua.setup {
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)
    end,
}
--[[require("lspconfig").tsserver.setup {]]
    --[[on_attach = function(client, bufnr)]]
        --[[require "lsp_signature".on_attach(signature_setup, bufnr)]]
    --[[end]]
--[[}]]
