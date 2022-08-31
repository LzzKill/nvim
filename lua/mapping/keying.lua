local map = vim.api.nvim_set_keymap
vim.g['mapleader']=" "
map('n', '<leader>p', ':Prettier<CR>', {noremap = true})
map('n', '<leader>q', ':q<CR>', {noremap = true})
map('n', '<leader>fb', ':Bracey<CR>', {noremap = true})
map('n', '<leader>fr', ':BraceyReload<CR>', {noremap = true})

map('n', 'U', '<nop>', {noremap = true})
map('n', 'c', '<nop>', {noremap = true})
map('n', 'S', '<nop>', {noremap = true})
map('n', 'm', '<nop>', {noremap = true})
map('n', '<F2>', '<nop>', {noremap = true})
map('n', '<F1>', '<nop>', {noremap = true})

map('n', '<leader>fi', ':PackerInstall<CR>', {noremap = true})
map('n', '<leader>fs', ':PackerSync<CR>', {noremap = true})
map('n', '<leader>fS', ':PackerStatus<CR>', {noremap = true})

map('n', 'U', '<C-r>', {noremap = true})
map('n', '<F2>', ':Ranger', {noremap = true})
map('n', ';', ':', {noremap = true})

map('n', 'mv', ':+tabnext<CR>', {noremap = true})
map('n', 'mc', ':-tabnext<CR>', {noremap = true})

map('n', 'cm', '<C-w>t<C-w>H', {noremap = true})
map('n', 'cc', '<C-w>t<C-w>K', {noremap = true})
map('n', 'e', '<C-w>w', {noremap = true})
map('n', '<up>', ':res +1<CR>', {noremap = true})
map('n', '<down>', ':res -1<CR>', {noremap = true})
map('n', '<left>', ':vertical resize +1<CR>', {noremap = true})
map('n', '<right>', ':vertical resize -1<CR>', {noremap = true})

map('n', 'tt', ':NvimTreeToggle<CR>', {noremap = true})
map('n', '<leader>tr', ':NvimTreeRefresh<CR>', {noremap = true})
map('n', '<leader>tb', ':TagbarToggle<CR>', {noremap = true})
map('n', '<leader>ff', ':Telescope<CR>', {noremap = true})
map('n', 'ff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>m', '<Plug>MarkdownPreview', {noremap = true})
map('n', '<leader>o', '<Plug>StopMarkdownPreview', {noremap = true})
map('n', '<leader>c', ':Autoformat<CR>', {noremap = true})

map('n', '<leader>=', ':FloatermNext<CR>', {noremap = true})

