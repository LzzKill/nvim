require'nvim-tree'.setup {
    -- 关闭文件时自动关闭
    auto_close = true,
    -- 不显示 git 状态图标
    git = {
        enable = true
    },
    renderer = {
        group_empty = false,
    },
    view = {
        side = "right",
        number = false,
        adaptive_size = true,
        centralize_selection = false,
        hide_root_folder = false,
        relative_number = false,
        signcolumn = "yes",
    }
}
