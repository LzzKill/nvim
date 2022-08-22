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
syntax sync minlines=64

au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
inoreabbrev <expr> <bar><bar>
\ <SID>isAtStartOfLine('\|\|') ?
\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
\ <SID>isAtStartOfLine('__') ?
\ '<c-o>:silent! TableModeDisable<cr>' : '__'

autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i

autocmd VimEnter *  colorscheme gruvbox-material
autocmd VimEnter *  RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:tagbar_type_markdown = {
\ 'ctagstype' : 'markdown',
\ 'kinds' : [
\ 'h:Chapter',
\ 'i:Section',
\ 'k:Paragraph',
\ 'j:Subparagraph'
\ ]
\ }
