local lazy = "folke/lazy.nvim"

local completion = {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function()
      require("configs.luasnip")
    end,
    dependencies = { "friendly-snippets" }
  },
}

local lsp = {
  { "neovim/nvim-lspconfig",           config = function() require("configs.lspconfig") end, event = "VeryLazy" },
  { "jose-elias-alvarez/null-ls.nvim", config = function() require("configs.null-ls") end,   event = "VeryLazy" }
}

local display = {
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({ presets = { lsp_doc_border = true } })
    end,
    dependencies = { "nui.nvim" },
    event = "UILeave"
  },
  { "karb94/neoscroll.nvim",       event = "UIEnter",  config = true },
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy", config = true, },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
    event = "UIEnter"
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("configs.notify")
    end,
    event = "UIEnter",
    lazy = true
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "UIEnter",
    config = true
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.nvim-treesitter")
    end,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = "VeryLazy",
    enable = false
  },
  { "MunifTanjim/nui.nvim",         lazy = true },
  { "kyazdani42/nvim-web-devicons", lazy = true, },
  { "junegunn/vim-peekaboo",        event = "VeryLazy" },
}

local markdown = {
  {
    "dhruvasagar/vim-table-mode",
    config = function()
      require("configs.vim_table_mode")
    end,
    ft = "markdown"
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = "markdown",
  },
}

local tool = {
  { "folke/todo-comments.nvim", event = "VeryLazy",    config = true, },
  { "kylechui/nvim-surround",   event = "VeryLazy",    config = true },
  { "windwp/nvim-autopairs",    event = "InsertEnter", config = true },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<space>cc",
          block = "<space>bc"
        },
        opleader = {
          line = "<space>c",
          block = "<space>b"
        }
      })
    end,
    event = "VeryLazy"
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("configs.neo-tree")
    end,
    cmd = { "Neotree", "NoetreeFocus", "NeoTreeClose", "NeotreeShow" },
    key = {"<A-f>"},
    event = "User DirOpened",
  },
  { "lewis6991/gitsigns.nvim", config = true, event = "UIEnter", cmd = "Gitsigns", },
  {
    "akinsho/toggleterm.nvim",
    branch = "main",
    config = true,
    cmd = {
      "ToggleTerm",
      "TermExec",
      "ToggleTermToggleAll",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },
  },
  { "nvim-lua/plenary.nvim",   lazy = true },
}

local plugins = {
  require("configs.cmp"),
  lazy,
  completion,
  lsp,
  require("configs.nvim-telescope"),
  display,
  require("configs.catppuccin"),
  tool,
  markdown
}

return plugins
