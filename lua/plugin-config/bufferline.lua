vim.opt.termguicolors = false
require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "coc",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "NvimTree Files",
            highlight = "Directory",
            text_align = "right"
        }}
    }
}
