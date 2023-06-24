local Map = {
  { ";",         ":",                      {"n", "v"}, {} },
  { "U",         "<C-r>" },
  { "<A-[>",     vim.diagnostic.goto_prev },
  { "<A-]>",     vim.diagnostic.goto_next },
  { "<leader>l", "<cmd>Lazy<cr>" },
  { "<leader>t", "<cmd>Telescope<cr>" },
  { "<leader>q", vim.diagnostic.setloclist },
  { "<space>w",  "<cmd>w<cr>" },
  { "<space>q",  "<cmd>q<cr>" },
  { "<space>Q",  "<cmd>q!<cr>" },
  { "<space>f",  "<cmd>Telescope fd<cr>" },
  { "<space>e",  "<cmd>Neotree<cr>" },
  { "<space>E",  vim.diagnostic.open_float },
}

local opt = { noremap = true, silent = true }
local mode = "n"

for _, m in ipairs(Map) do
  if not m[3] then m[3] = mode end
  if not m[4] then m[4] = opt end

  vim.keymap.set(m[3], m[1], m[2], m[4])
end
