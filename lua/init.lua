require('plugin-config/plugins')
require('plugin-config/bufferline')
require('plugins')
require('mapping/keying')
require('plugin-config/nvim-tree')
require('plugin-config/lualine')
require('plugin-config/symbols-outline')
require('cfg')

--Coc.nvim
vim.g['coc_global_extensions'] = {'coc-prettier', 'coc-git', 'coc-xml', 'coc-yaml', 'coc-json', 'coc-lua'}
--Coc.nvim
--
vim.o.background = 'light'

vim.cmd[[
colorscheme gruvbox-material
"Table Mode"
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

filetype indent on
filetype on
filetype plugin on
filetype indent on
syntax on

colorscheme gruvbox-material
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
inoreabbrev <expr> <bar><bar>
\ <SID>isAtStartOfLine('\|\|') ?
\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
\ <SID>isAtStartOfLine('__') ?
\ '<c-o>:silent! TableModeDisable<cr>' : '__'

autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i

autocmd VimEnter *  RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

"autocmd vimenter * ++nested colorscheme gruvbox-material
]]
