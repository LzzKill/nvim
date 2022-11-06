-- alpha.nvim
local startify = require("alpha.themes.startify")
startify.section.header.val = {
[[    _   _   ___     _____ ____ ___    _      _]],
[[   | | | \ | \ \   / /_ _|  _ \_ _|  / \    | |]],
[[   | | |  \| |\ \ / / | || | | | |  / _ \   | |]],
[[   | | | |\  | \ V /  | || |_| | | / ___ \  | |]],
[[   | | |_| \_|  \_/  |___|____/___/_/   \_\ | |]],
[[   |_|                                      |_|]],
[[  _    __            _                          _]],
[[ | |  / _|_   _  ___| | __  _   _  ___  _   _  | |]],
[[ | | | |_| | | |/ __| |/ / | | | |/ _ \| | | | | |]],
[[ | | |  _| |_| | (__|   <  | |_| | (_) | |_| | | |]],
[[ | | |_|  \__,_|\___|_|\_\  \__, |\___/ \__,_| | |]],
[[ |_|                        |___/              |_|]]
}
require("alpha").setup(startify.config)


-- indent_blankline
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

require("lsp_signature").setup()
require('gitsigns').setup()
-- Loader PluginConfig

--require("plugin-config.LineBuffer")
require("plugin-config.nvim-treesitter")
require("plugin-config.tokyonight")
require("plugin-config.trouble")
require("plugin-config.cmp")
