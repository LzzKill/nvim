local Map = {
  { ";",         ":",                      "n", {} },
  { "U",         "<C-r>" },
  { "<A-[>",     vim.diagnostic.goto_prev },
  { "<A-]>",     vim.diagnostic.goto_next },
  { "<C-x>",     "<cmd>Lazy<cr>" },
  { "<leader>t",     "<cmd>Telescope<cr>" },
  { "<leader>q", vim.diagnostic.setloclist },
  { "<space>w",  "<cmd>w<cr>" },
  { "<space>q",  "<cmd>q<cr>" },
  { "<space>Q",  "<cmd>q!<cr>" },
  { "<space>f",  "<cmd>Telescope fd<cr>" },
  { "<A-f>",  "<cmd>Neotree<cr>" },
  { "<space>E",  vim.diagnostic.open_float },
}
local opt = { noremap = true, silent = true }

for _, m in ipairs(Map) do
  local n = "n"
  local o = opt
  if m[3] then n = m[3] end
  if m[4] then o = m[4] end
  vim.keymap.set(n, m[1], m[2], o)
end
