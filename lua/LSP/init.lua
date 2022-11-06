require("mason").setup(
{
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}
)
require("nvimcmp") --nvim-cmp
require("lspsaga")
require("LSP/Server")
