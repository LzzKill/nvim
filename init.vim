" Packer插件管理
lua require('plugins')
" Terrsitter 插件;w
lua require('plugin-config/nvim-treesitter')
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

" colorscheme gruvbox-material
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
autocmd VimEnter *  colorscheme default
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

