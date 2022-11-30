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
vim.g["table_mode_corner"] = "|"
vim.g["table_mode_border"] = 0
vim.g["table_mode_fillchar"] = "="

vim.cmd[[
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
inoreabbrev <expr> <bar><bar>
\ <SID>isAtStartOfLine('\|\|') ?
\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
\ <SID>isAtStartOfLine('__') ?
\ '<c-o>:silent! TableModeDisable<cr>' : '__'
"set fillchars=eob:\ ,vert:\ 
set fillchars=vert:\ 
]]

-- if neoclide
vim.cmd[[
if exists("g:neovide")
    let neovide_cursor_vfx_mode = "railgun"
    let neovide_scale_factor = 0.8
    let neovide_transparency = 0.8
endif
]]
