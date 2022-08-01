"c

set conceallevel=2

"d

"e
set encoding=utf8
set expandtab

"f
set fo=cqrt

"g
"h
set helplang=cn

"i
set incsearch

"j
"k
"l
set laststatus=2
set linebreak


"m

"n
set number
set nocompatible "Not share vi
set hls

"o
"p
"q
"r
set ruler

"s
set showcmd
set noshowmode
set shiftwidth=4
set scrolloff=5
set sidescrolloff=4
syntax on
" syn on
syntax sync minlines=64
"t
set t_Co=256
set textwidth=80
set tabstop=4

"u
"v
"w
set ww=<,>,h,l
set wildmenu
set wrap
set wrapmargin=2

"x
"y
"z

let mapleader = ","

filetype indent on
filetype on
filetype plugin on
filetype indent on
"--Vim set--"
set laststatus=2
set t_Co=256

"""

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

" --YouCompleteMe--
" Cancel popup
set completeopt=longest,menu
" change ycm color

" If you're on an arm mac, uncomment the following line
" let g:ycm_clangd_binary_path=trim(system('brew --prefix llvm')).'/bin/clangd'

" If the base settings don't repro, paste your existing config for YCM only,
" here:
" let g:ycm_....

" Load YCM (only)
let &rtp .= ',' . expand( '<sfile>:p:h' )
filetype plugin indent on

highlight Pmenu ctermfg=3 ctermbg=3 guifg=#c0c0c0 guibg=#000000
"--YouCompleteMe--
hi Normal  ctermfg=252 ctermbg=none

au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'



autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
autocmd VimEnter *  colorscheme default
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


