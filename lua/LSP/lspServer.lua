local CLANG = {
    "c",
    "cpp",
    "objc",
    "objcpp",
    "cuda",
    "proto",
    "h",
    "hpp"
}

require "lspconfig".luau_lsp.setup {}                                           --lua
require "lspconfig".cssls.setup {}                                              --css
local capabilities = vim.lsp.protocol.make_client_capabilities()                --css
capabilities.textDocument.completion.completionItem.snippetSupport = true       --css
require "lspconfig".pylsp.setup {                                               --Python
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
require "lspconfig".jedi_language_server.setup {}                               --Python
require "lspconfig".html.setup {                                                --HTML
    capabilities = capabilities
}
require "lspconfig".tsserver.setup {}                                           --TypeScript
require "lspconfig".clangd.setup {                                              --ClangD
    filetype = CLANG
}
