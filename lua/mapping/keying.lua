local map = vim.api.nvim_set_keymap
vim.g['mapleader']=" "
local opt_n = {noremap = true}
map('n', '<leader>w', ':w<CR>', opt_n)

map('n', '<leader>p', ':Prettier<CR>', opt_n)
map('n', '<leader>q', ':q<CR>', opt_n)
map('n', '<leader>fb', ':Bracey<CR>', opt_n)
map('n', '<leader>fr', ':BraceyReload<CR>', opt_n)

map('n', 'U', '<nop>', opt_n)
map('n', 'c', '<nop>', opt_n)
map('n', 'S', '<nop>', opt_n)
map('n', 'm', '<nop>', opt_n)
map('n', '<F2>', '<nop>', opt_n)
map('n', '<F1>', '<nop>', opt_n)

map('n', '<leader>fi', ':PackerInstall<CR>', opt_n)
map('n', '<leader>fs', ':PackerSync<CR>', opt_n)
map('n', '<leader>fS', ':PackerStatus<CR>', opt_n)

map('n', 'U', '<C-r>', opt_n)
map('n', '<F2>', ':RnvimrToggle<CR>', opt_n)
map('n', ';', ':', opt_n)

map('n', 'mv', ':+tabnext<CR>', opt_n)
map('n', 'mc', ':-tabnext<CR>', opt_n)

map('n', 'cm', '<C-w>t<C-w>H', opt_n)
map('n', 'cc', '<C-w>t<C-w>K', opt_n)
map('n', 'e', '<C-w>w', opt_n)
map('n', '<up>', ':res +1<CR>', opt_n)
map('n', '<down>', ':res -1<CR>', opt_n)
map('n', '<left>', ':vertical resize +1<CR>', opt_n)
map('n', '<right>', ':vertical resize -1<CR>', opt_n)

map('n', 'tt', ':NvimTreeToggle<CR>', opt_n)
map('n', '<leader>tr', ':NvimTreeRefresh<CR>', opt_n)
map('n', '<leader>tb', ':TagbarToggle<CR>', opt_n)
map('n', '<leader>ff', ':Telescope<CR>', opt_n)
map('n', 'ff', ':Telescope find_files<CR>', opt_n)
map('n', '<leader>m', '<Plug>MarkdownPreview', opt_n)
map('n', '<leader>o', '<Plug>StopMarkdownPreview', opt_n)
map('n', '<leader>c', ':Autoformat<CR>', opt_n)

map('n', '<leader>=', ':FloatermNext<CR>', opt_n)

map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt_n)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt_n)
