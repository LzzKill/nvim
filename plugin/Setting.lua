local Configs = {
  termguicolors = true,
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
}
for i, j in pairs(Configs) do
  vim.opt[i] = j
end

vim.opt.listchars:append "space:⋅"
