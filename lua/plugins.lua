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
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.null-ls")
    end,
    ft = { "json", "py", "javascript", "typescript" }
  }
}

local nvim_telescope = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "telescope-fzf-native.nvim", "noice", "telescope-ui-select.nvim" },
    cmd = "Telescope",
    lazy = true
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
  { "nvim-telescope/telescope-ui-select.nvim",  lazy = true }
}

local display = {
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({ presets = { lsp_doc_border = true } })
    end,
    dependencies = { "nui.nvim" }
  },
  { "karb94/neoscroll.nvim",        event = "BufWinEnter",     config = true },
  { "norcalli/nvim-colorizer.lua",  event = "User FileOpen", config = true, },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
    event = "VimEnter"
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("configs.notify")
    end,
    event = "VimEnter"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FileOpen",
    config = function()
      require("config.indent_blankline")
    end
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   config = function()
  --     require("configs.nvim-treesitter")
  --   end,
  --   cmd = {
  --     "TSInstall",
  --     "TSUninstall",
  --     "TSUpdate",
  --     "TSUpdateSync",
  --     "TSInstallInfo",
  --     "TSInstallSync",
  --     "TSInstallFromGrammar",
  --   },
  --   event = "BufEnter",
  --   dependencies = { "nvim-ts-rainbow2", "vim-matchup" },
  --   enable = false
  -- },
  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    lazy = true
  },
  { "junegunn/vim-peekaboo",        event = "BufWinEnter" },
  { "HiPhish/nvim-ts-rainbow2",     lazy = true },
  { "MunifTanjim/nui.nvim",         lazy = true },
  { "kyazdani42/nvim-web-devicons", lazy = true, },
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
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
    dependencies = {"hrsh7th/nvim-cmp" },
    lazy = true
  },
  {
    "numToStr/Comment.nvim",
    config = true,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("configs.neo-tree")
    end,
    cmd = { "Neotree", "NoetreeFocus", "NeoTreeClose", "NeotreeShow" },
    event = "User DirOpened",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    event = "User FileOpened",
    cmd = "Gitsigns",
  },
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
  { "nvim-lua/plenary.nvim", lazy = true },
}

local plugins = {
  require("configs.cmp"),
  lazy,

  completion,
  lsp,
  nvim_telescope,
  display,
  require("configs.catppuccin"),
  tool,
  markdown
}

return plugins
