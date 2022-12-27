local filetypes = {
  'c', 'h', 'cpp', 'hpp', 'html', 'css', 'ts', 'js', 'py'
}

local cmp = {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
}
local Telescope = {
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    config = function()
      require("Plugin.source.nvim-telescope")
    end,
    event = "BufWinEnter" },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}

local colorscheme = {
  "tiagovla/tokyodark.nvim",
  "navarasu/onedark.nvim",
  "morhetz/gruvbox",
  "sainnhe/gruvbox-material",
  { "folke/tokyonight.nvim",
    config = function()
      require("Plugin.source.tokyonight")
    end
  },
  { "catppuccin/nvim", name = "catppuccin" },
  "Shatur/neovim-ayu",
  "LunarVim/lunar.nvim"
}

local ui = {
  { "karb94/neoscroll.nvim", event = "BufWinEnter" },
  { "norcalli/nvim-colorizer.lua", event = "BufWinEnter" },
  { "folke/noice.nvim", event = "BufWinEnter", config = function()
    require("noice").setup {
      lsp = {
        signature = {
          enabled = false
        }
      },
      presets = {
        long_message_to_split = true
      },
    }
  end },
  { 'stevearc/dressing.nvim', event = "BufWinEnter" },
  { "lukas-reineke/indent-blankline.nvim", event = "BufReadPre", config = function()
    require("indent_blankline").setup {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true
    }
  end },
  { "petertriho/nvim-scrollbar", event = "BufWinEnter" },
}
local markdown = {
  { "dhruvasagar/vim-table-mode", ft = { "markdown" }
  },
  { "iamcco/mathjax-support-for-mkdp", ft = { "markdown" } },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end
  },
}
Plugins = {
  { "akinsho/bufferline.nvim", event = "BufWinEnter", config = function() require("Plugin.source.BufferLine") end },
  { "nvim-lualine/lualine.nvim", event = "BufWinEnter", config = function() require("Plugin.source.LuaLine") end },
  { "lewis6991/gitsigns.nvim", event = "BufRead" },
  { "sindrets/diffview.nvim", event = "BufWinEnter" },
  { "akinsho/toggleterm.nvim", event = "BufWinEnter" },
  { "folke/todo-comments.nvim", event = "BufReadPre" },
  { "numToStr/Comment.nvim", event = "BufReadPre" },
  { "ray-x/cmp-treesitter", event = "BufReadPre" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPre",
    config = function() require("Plugin.source.nvim-treesitter") end },
  { "p00f/nvim-ts-rainbow", event = "BufReadPost", },
  "MunifTanjim/nui.nvim",
  "folke/lazy.nvim", -- Plugin mamager
  cmp,
  Telescope,
  colorscheme,
  ui,
  markdown,
  "junegunn/vim-peekaboo",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  "smjonas/live-command.nvim",
  "rainbowhxch/beacon.nvim",
  "nvim-tree/nvim-tree.lua",
  "s1n7ax/nvim-window-picker",
  { "windwp/nvim-autopairs", config = function()
    require("nvim-autopairs").setup {
      enable_check_bracket_line = false
    }
  end },
  "turbio/bracey.vim",
  "mg979/vim-visual-multi",
  {
    "glacambre/firenvim",
    build = function() vim.fn["firenvim#install"](0) end
  },
  { "L3MON4D3/LuaSnip", event = "BufReadPre" },
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "ray-x/lsp_signature.nvim",
  { "neovim/nvim-lspconfig",
    config = function()
      local on_attach = require("Plugin.source.Server")
      local lspconfig = require("lspconfig")
      local LSP = { "clangd", "cssls", "pyright", "quick_lint_js", "html", "sumneko_lua" }
      for _, lsp in ipairs(LSP) do lspconfig[lsp].setup { on_attach = on_attach() } end
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("Plugin.source.null-ls")
    end },
  { "glepnir/lspsaga.nvim",
    ft = filetypes,
    branch = "main"
  },
}
require("lazy").setup(Plugins)

Plugins_ = {
  "lsp_signature", "scrollbar.handlers.gitsigns",
  "todo-comments", "colorizer"
}

for _, Plugin in ipairs(Plugins_) do require(Plugin).setup() end
require "lspsaga"
-- Loader PluginConfigs
local Config = {
  "tokyonight", "cmp", "Server"
}
for _, Plugin in ipairs(Config) do require("Plugin.source." .. Plugin) end
