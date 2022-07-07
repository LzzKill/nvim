"--table-mode--"""
let g:table_mode_corner = '|'
let g:table_mode_border=0
let g:table_mode_fillchar='='

function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"--table-mode--""

"--Keymaps--"
map U <nop>
map c <nop>
map S <nop>
map m <nop>
map <F2> <nop>
map <F1> <nop>

map } $
map fp :PlugInstall<CR>

map Q :q <CR>
map E :w <CR>
map U <C-r>
map <F12> :term <CR>
map <F1> :Ranger <CR>
map <F2> :E <CR>

map ; :
"--Keymaps
map cm <C-w>t<C-w>H
map cc <C-w>t<C-w>K

map <up> :res +5 <CR>
map <down> :res -5 <CR>
map <left> :vertical resize-5 <CR>
map <right> :vertical resize+5 <CR>

map e <C-w>w
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

noremap <C-x> <Esc>lxi
noremap <C-X> <Esc>llxhi
"--Keymaps--"

"--auto-pairs--"
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
"--auto-pairs--"

""
" for normal mode
nmap <silent> fm <Plug>MarkdownPreview
" for insert mode
nmap <silent> fo <Plug>StopMarkdownPreview
""

"--airline--"
let g:airline_theme='quantum'
"air--line"

"--Vim--"
set background=dark

colorscheme gruvbox-material
"--Vim--"

"--MarkDown--"
let g:mkdp_browser='firefox'

"--MarkDown--"

"--Ranger--"
let g:ranger_map_keys = 0

"--Ranger--"

"--autoformat--
noremap fc :Autoformat<CR>
let g:autoformat_verbosemode=1

"--autoformat--""


"--Netrw--"
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 100
"--instant_markdown--"

"--Netrw--"
" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1}

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

"
" But remember that neovim is not officially supported, so please reproduce in
" Vim.

" Enable debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

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

"--rainbow--"
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

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

autocmd VimEnter *  colorscheme gruvbox-material
autocmd VimEnter *  RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"--rainbow--"

"设置切换Buffer快捷键"
nnoremap mv :+tabnext<CR>
nnoremap mc :-tabnext<CR>
hi Normal  ctermfg=252 ctermbg=none
"MD.VIM
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=2
let g:vim_markdown_frontmatter=1

"------Tagbar config------
nmap tn :TagbarToggle<CR>
"------End------

"------Nerdtree config------
nnoremap tt :NERDTreeToggle<CR>
" Change tree icon
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" Window Position
let g:NERDTreeWinPos='left'
" Window Size
let g:NERDTreeSize=30
" Window number
let g:NERDTreeShowLineNumbers=1
" hidden file
let g:NERDTreeHidden=0
"------End------

"设置默认图片名称。当图片名称没有给出时，使用默认图片名称
let g:mdip_imgname = 'image'
"设置快捷键，个人喜欢 Ctrl+p 的方式，比较直观
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i
"设置tagber对于markdown的支持
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Chapter',
            \ 'i:Section',
            \ 'k:Paragraph',
            \ 'j:Subparagraph'
            \ ]
            \ }
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
let g:UltiSnipsSnippetDirectories=["path/of/snippetDirectories"]
let g:UltiSnipsEditSplit="vertical"

"Plug.vim
call plug#begin('~/.config/nvim/plugged')
if has('win32') || has('win64')
    Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

"airline and its themes
Plug 'vim-airline/vim-airline'      
Plug 'vim-airline/vim-airline-themes'

Plug 'kien/rainbow_parentheses.vim' "彩虹括号
Plug 'dag/vim-fish' "fish terminal
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim' "vim rust
Plug 'suan/vim-instant-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode'
"YouCompleteMe
Plug 'tabnine/YouCompleteMe'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic' "语法检查机

Plug 'jiangmiao/auto-pairs'
Plug 'tenfyzhong/CompleteParameter.vim'

Plug 'tpope/vim-fugitive'
Plug 'francoiscabrol/ranger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'yggdroot/indentline'  "从此告别游标卡尺

Plug 'preservim/nerdcommenter'
"TypeScript
Plug 'leafgarland/typescript-vim'

"HTML

Plug 'mattn/emmet-vim'

" Vim Color
Plug 'morhetz/gruvbox'
Plug 'yuttie/inkstained-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'tyrannicaltoucan/vim-quantum'
" 多光标
Plug 'mg979/vim-visual-multi'

"格式化
Plug 'Chiel92/vim-autoformat'
"Cmake
Plug 'vhdirk/vim-cmake'
call plug#end()

