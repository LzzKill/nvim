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
set fillchars=eob:\ ,vert:\ 
autocmd FileType markdown nnoremap <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i
]]
