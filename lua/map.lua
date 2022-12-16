local map = vim.api.nvim_set_keymap
local opt_n = {noremap = true}

map("n", "<space>w", ":w<CR>", opt_n)
map("n", "<space>q", ":q<CR>", opt_n)

map("n", "U", "<nop>", opt_n)
map("n", "S", "<nop>", opt_n)
map("", "<F1>", "<nop>", {})
map("", "<F2>", "<nop>", {})
map("n", "<F1>", "<nop>", {})
map("n", "<F2>", "<nop>", {})
-- Packer
map("n", "<leader>pi", ":PackerInstall<CR>", opt_n)
map("n", "<leader>ps", ":PackerSync<CR>", opt_n)
map("n", "<leader>pS", ":PackerStatus<CR>", opt_n)
map("n", "<leader>pc", ":PackerCompile<CR>", opt_n)
map("n", "<leader>pu", ":PackerUpdate<CR>", opt_n)
map("n", "<leader>pC", ":PackerClean<CR>", opt_n)
map("n", "<leader>pl", ":PackerLoad<CR>", opt_n)

map("n", "U", "<C-r>", opt_n)
map("n", ";", ":", opt_n)

map("n", "mv", ":+tabnext<CR>", opt_n)
map("n", "mc", ":-tabnext<CR>", opt_n)

map("n", "cm", "<C-w>t<C-w>H", opt_n)
map("n", "cc", "<C-w>t<C-w>K", opt_n)
map("n", "E", "<C-w>w", opt_n)

map("n", "<space>FF", ":Telescope<CR>", opt_n)
map("n", "<space>ff", ":Telescope find_files<CR>", opt_n)
-- NeoTree
map("n", "<space>n<space>", ":Neotree<CR>", opt_n)
map("n", "<space>nn", ":NeoTreeShow<CR>", opt_n)
map("n", "<space>nm", ":NeoTreeClose<CR>", opt_n)

-- BufferLine
map("n", "<A-L>", ":BufferLineCyclePrev<CR>", opt_n)
map("n", "<A-H>", ":BufferLineCycleNext<CR>", opt_n)
map("n", "<A-P>", ":BufferLinePink<CR>", opt_n)
map("n", "<A-C>", ":BufferLinePinkClose<CR>", opt_n)

-- LSP
local lsp_opts = {noremap = true, silent = true}
map = vim.keymap.set
map("n", "<space>e", vim.diagnostic.open_float, lsp_opts)
map("n", "[d", vim.diagnostic.goto_prev, lsp_opts)
map("n", "]d", vim.diagnostic.goto_next, lsp_opts)
map("n", "<space>Q", vim.diagnostic.setloclist, lsp_opts)
