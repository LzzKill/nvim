local on_attach = function(client, bufnr)
    require"lsp_signature".on_attach(signature_setup, bufnr)
    local map = vim.keymap.set
    -- Enable completion triggered by <c-x><c-o>
    --[[vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")]]
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    map("n", "gD", vim.lsp.buf.declaration, bufopts)
    map("n", "gd", vim.lsp.buf.definition, bufopts)
    map("n", "K", ":Lspsaga hover_doc", bufopts)
    map("n", "gi", vim.lsp.buf.implementation, bufopts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    map("n", "<space>WA", vim.lsp.buf.add_workspace_folder, bufopts)
    map("n", "<space>WR", vim.lsp.buf.remove_workspace_folder, bufopts)
    map(
        "n",
        "<space>WL",
        function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        bufopts
    )
    map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    map("n", "\\lr", ":Lspsaga rename", bufopts)
    map("n", "\\la", ":Lspsaga code_action", bufopts)
    map("n", "gr", vim.lsp.buf.references, bufopts)
    map(
        "n",
        "<space>fF",
        function()
            vim.lsp.buf.format {async = true}
        end,
        bufopts
    )
end
local lspconfig = require("lspconfig")
local LSP = {
    "clangd",
    "cssls",
    "pyright",
    "quick_lint_js",
    "html"
}
for i = 1, #LSP do
    lspconfig[LSP[i]].setup {
        on_attach = on_attach()
    }
end
