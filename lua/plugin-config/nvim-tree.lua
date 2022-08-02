require'nvim-tree'.setup {
    -- 关闭文件时自动关闭
    -- auto_close = false,
    -- 显示 git 状态图标
    git = {
        enable = true
    },
    renderer = {
        group_empty = false,
    },
    view = {
        side = "right",
        adaptive_size = true,
        centralize_selection = false,
        hide_root_folder = false,
        signcolumn = "yes",
    }
}