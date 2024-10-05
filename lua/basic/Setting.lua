local Configs = {
  termguicolors = true,  --真彩色
  tabstop = 2,           --tab显示宽度
  -- expandtab = true,     -- tab输入变空格
  laststatus = 1,        --状态栏
  linebreak = true,      --折叠行行号
  number = true,         --行号
  relativenumber = true, --相对行号
  hlsearch = true,       --高亮
  ruler = true,          -- “游标卡尺”
  shiftwidth = 2,        --自动缩进数
  scrolloff = 3,         -- 滚行数
  sidescrolloff = 3,     --横滚
  textwidth = 120,       --行长度
  wildmenu = true,       --补全
  wrap = true,
  wrapmargin = 2,
  encoding = "UTF-8",
  fillchars = "eob: ",
  list = true,
}
for i, j in pairs(Configs) do
  vim.opt[i] = j
end

vim.opt.listchars:append("space:⋅")
