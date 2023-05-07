local lazy = "folke/lazy.nvim"

local completion = {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    config = function()
      require("configs.cmp")
    end,
    dependencies = { "cmp-nvim-lsp", "cmp_luasnip", "cmp-buffer" }
  },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function()
      require("configs.luasnip")
    end,
    dependencies = { "friendly-snippets" }
  },
  { "rafamadriz/friendly-snippets", lazy = true },
  { "hrsh7th/cmp-nvim-lsp",         lazy = true },
  { "hrsh7th/cmp-buffer",           lazy = true },
  { "saadparwaiz1/cmp_luasnip",     lazy = true },
}

local lsp = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
    ft = { "c", "cpp", "py", "h", "hpp", "markdown", "html", "css", "lua" }
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
  {
    "karb94/neoscroll.nvim",
    event = "BufWinEnter",
    config = function()
      require('neoscroll').setup()
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "User FileOpened",
    config = function()
      require("colorizer").setup()
    end
  },
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
    event = "User FileOpened",
    config = function()
      require("config.indent_blankline")
    end
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
    event = "BufEnter",
    dependencies = { "nvim-ts-rainbow" }
  },
  { "junegunn/vim-peekaboo",        event = "BufWinEnter" },
  { "p00f/nvim-ts-rainbow",         lazy = true },
  { "MunifTanjim/nui.nvim",         lazy = true },
  { "kyazdani42/nvim-web-devicons", lazy = true, },
}

local theme = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("configs.catppuccin")
      vim.cmd.colorscheme("catppuccin")
    end
  }
}

local markdown = {
  { "dhruvasagar/vim-table-mode",
  config = function()
    require("configs.vim_table_mode")
  end,
  ft = "markdown" },
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    lazy = true
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("configs.comment").setup()
    end,
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
    config = function()
      require("toggleterm").setup()
    end,
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
  lazy,
  completion,
  lsp,
  nvim_telescope,
  display,
  theme,
  tool,
  markdown
}

return plugins
