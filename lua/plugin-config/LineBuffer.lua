require("lualine").setup(
    {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = {left = "", right = ""},
            section_separators = {left = "", right = ""},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000
            }
        }
    }
)

require("Bufferline").setup(
    {
        options = {
            diagnostics = "nvim_lsp"
        },
        offsets = {
            {
                filetype = "neo-tree",
                text = "C:/Windows/explorer.exe"
            }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false
    }
)
