local M = {}

M.N_maps = {
  { "<space>w", "<cmd>w<cr>" },
  { "<space>q", "<cmd>q<cr>" },
  { "U", "<C-r>" },
  { "<leader>pi", "<cmd>PackerInstall<cr>" },
  { "<leader>ps", "<cmd>PackerSync<cr>" },
  { "<leader>pS", "<cmd>PackerStatus<cr>" },
  { "<leader>pc", "<cmd>PackerCompile<cr>" },
  { "<leader>pu", "<cmd>PackerUpdate<cr>" },
  { "<leader>pC", "<cmd>PackerClean<cr>" },
  { "<leader>pl", "<cmd>PackerLoad<cr>" },
  { "<leader>cm", "<C-w>t<C-w>H" },
  { "<leader>cc", "<C-w>t<C-w>K" },
  { "E", "<C-w>w" },
  { "<space>FF", ":Telescope<CR>" },
  { "<space>ff", ":Telescope find_files<CR>" },
  { "<space>n<space>", ":NvimTreeToggle<CR>" },
  { "<space>e", ":NvimTreeToggle<CR>" },
  { "<A-L>", ":BufferLineCyclePrev<CR>" },
  { "<A-H>", ":BufferLineCycleNext<CR>" },
  { "<A-P>", ":BufferLinePink<CR>" },
  { "<A-C>", ":BufferLinePinkClose<CR>" },
  { "<space>e", vim.diagnostic.open_float },
  { "[d", vim.diagnostic.goto_prev },
  { "]d", vim.diagnostic.goto_next },
  { "<space>Q", vim.diagnostic.setloclist },
}

M.Basic_configs = {
  expandtab = true,
  laststatus = 2,
  linebreak = true,
  number = true,
  relativenumber = true,
  hls = true,
  ruler = true,
  shiftwidth = 2,
  scrolloff = 5,
  sidescrolloff = 2,
  textwidth = 80,
  tabstop = 2,
  wildmenu = true,
  wrap = true,
  wrapmargin = 2,
  encoding = "UTF-8",
  fillchars = "eob: ",
  list = true,
  termguicolors = true,
}

return M