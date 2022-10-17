require('plugin-config/plugins')
require('plugin-config/bufferline')
require('plugins')
require('mapping/keying')
require('plugin-config/nvim-tree')
require('plugin-config/lualine')
require('plugin-config/symbols-outline')
require('LSP')
require('cfg')

--vim.o.background = 'light'

vim.cmd[[
colorscheme onedark

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

au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
inoreabbrev <expr> <bar><bar>
\ <SID>isAtStartOfLine('\|\|') ?
\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
\ <SID>isAtStartOfLine('__') ?
\ '<c-o>:silent! TableModeDisable<cr>' : '__'
set fillchars=eob:\ ,vert:\ 
autocmd FileType markdown nnoremap <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i

autocmd VimEnter *  RainbowParenthesesToggle

"autocmd vimenter * ++nested colorscheme gruvbox-material
]]
