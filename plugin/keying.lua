local map = vim.api.nvim_set_keymap

map('n', '<space>', '<leader>', {noremap = true})
map('n', '<leader>p', ':Prettier', {noremap = true})
map('n', 'fb', ':Bracey<CR>', {noremap = true})
map('n', 'fr', ':BraceyReload<CR>', {noremap = true})

map('n', 'U', '<nop>', {noremap = true})
map('n', 'c', '<nop>', {noremap = true})
map('n', 'S', '<nop>', {noremap = true})
map('n', 'm', '<nop>', {noremap = true})
map('n', '<F2>', '<nop>', {noremap = true})
map('n', '<F1>', '<nop>', {noremap = true})

map('n', '}', '$', {noremap = true})

map('n', 'fi', ':PackerInstall<CR>', {noremap = true})
map('n', 'fs', ':PackerSync<CR>', {noremap = true})
map('n', 'fS', ':PackerStatus<CR>', {noremap = true})
map('n', 'ff', ':FZF<CR>', {noremap = true})

map('n', 'U', '<C-r>', {noremap = true})
map('n', '<F2>', ':Ranger', {noremap = true})
map('n', ';', ':', {noremap = true})

map('n', 'mv', ':+tabnext<CR>', {noremap = true})
map('n', 'mc', ':-tabnext<CR>', {noremap = true})

map('n', 'cm', '<C-w>t<C-w>H', {noremap = true})
map('n', 'cc', '<C-w>t<C-w>K', {noremap = true})
map('n', 'e', '<C-w>w', {noremap = true})
map('n', '<up>', ':res +1', {noremap = true})
map('n', '<down>', ':res -1', {noremap = true})
map('n', '<left>', ':vertical resize +1', {noremap = true})
map('n', '<up>', ':vertical resize -1', {noremap = true})

map('n', 'tt', ':NvimTreeToggle<CR>', {noremap = true})
map('n', 'tr', ':NvimTreeRefresh<CR>', {noremap = true})
map('n', 'tn', ':TagbarToggle<CR>', {noremap = true})

map('n', '<leader>m', '<Plug>MarkdownPreview', {noremap = true})
map('n', '<leader>o', '<Plug>StopMarkdownPreview', {noremap = true})
map('n', '<leader>c', ':Autoformat', {noremap = true})


