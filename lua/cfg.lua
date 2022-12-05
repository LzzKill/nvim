vim.opt.expandtab = true
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hls = true
vim.opt.ruler = true
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 4
vim.opt.textwidth = 80
vim.opt.tabstop = 4
vim.opt.ww = "<,>,h,l"
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.wrapmargin = 2
-- if neoclide
vim.cmd[[
if exists("g:neovide")
    let neovide_cursor_vfx_mode = "railgun"
    let neovide_scale_factor = 0.8
    let neovide_transparency = 0.8
endif
]]
