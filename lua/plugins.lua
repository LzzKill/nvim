local core_plug = {
  "folke/lazy.nvim"
}

local nvim_cmp = {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    config = function()
      require("configs.cmp")
    end,
    dependencies = {
      "cmp-nvim-lsp",
      "cmp_luasnip",
      "cmp-buffer"
    }
  },
  { "hrsh7th/cmp-nvim-lsp",     lazy = true },
  { "hrsh7th/cmp-buffer",       lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
}

local nvim_lsp = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
    ft = { "c", "cpp", "py", "h", "hpp", "markdown", "html", "css" }
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

local nvim_view = {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
    event = "VimEnter"
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
    "folke/noice.nvim",
    config = function()
      require("noice").setup({ presets = { lsp_doc_border = true } })
    end,
    dependencies = { "nui.nvim" }
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
    event = "User FileOpened",
    dependencies = { "nvim-ts-rainbow" }
  },
  { "p00f/nvim-ts-rainbow", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true }
}

local nvim_theme = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("configs.catppuccin")
      vim.cmd.colorscheme("catppuccin")
    end
  }
}

local nvim_snip = {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function()
      require("configs.luasnip")
    end,
    dependencies = { "friendly-snippets" }
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = true
  },
}

local nvim_other = {
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
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("configs.nvim-tree")
    end,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
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
    -- init = function()
    --   require("lvim.core.terminal").init()
    -- end,
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
}

local nvim_lib = {
  { "kyazdani42/nvim-web-devicons", lazy = true, },
  { "junegunn/vim-peekaboo",        event = "BufWinEnter" },
  { "nvim-lua/plenary.nvim",        lazy = true },
  { "folke/neodev.nvim",            lazy = true }
}

local plugins = {
  core_plug,
  nvim_cmp,
  nvim_lsp,
  nvim_telescope,
  nvim_view,
  nvim_theme,
  -- nvim_dap,
  nvim_snip,
  nvim_other,
  nvim_lib
}

return plugins
