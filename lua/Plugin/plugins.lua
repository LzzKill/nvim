local filetypes = {
  'c', 'h', 'cpp', 'hpp', 'html', 'css', 'ts', 'js', 'py', "lua"
}

local cmp = {
  {
    "hrsh7th/nvim-cmp",
    event = "BufReadPre",
    config = function()
      require("Plugin.source.cmp")
    end
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
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
  -- "tiagovla/tokyodark.nvim",
  { "folke/tokyonight.nvim", config = require("Plugin.source.tokyonight") },
  -- "navarasu/onedark.nvim",
  -- "morhetz/gruvbox",
  -- "sainnhe/gruvbox-material",
  -- { "catppuccin/nvim", name = "catppuccin" },
  -- "Shatur/neovim-ayu",
  -- "LunarVim/lunar.nvim"
}

local ui = {
  { "karb94/neoscroll.nvim",       event = "BufWinEnter", config = function() require('neoscroll').setup() end },
  { "norcalli/nvim-colorizer.lua", event = "BufWinEnter", config = function() require("colorizer").setup() end },
  { "folke/noice.nvim", event = "BufWinEnter", config = function()
    require("noice").setup({ presets = { lsp_doc_border = true } })
  end },
  { "rcarriga/nvim-notify", event = "BufWinEnter",
    config = function() require("notify").setup({ background_colour = "#000000", }) end },
  { "lukas-reineke/indent-blankline.nvim", event = "BufReadPre",
    config = function() require("Plugin.source.indent_blankline") end },
}
local markdown = {
  { "dhruvasagar/vim-table-mode",      ft = { "markdown" } },
  { "iamcco/mathjax-support-for-mkdp", ft = { "markdown" } },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end
  },
}
local Plugins = {
  "folke/lazy.nvim", -- Plugin mamager
  { "akinsho/bufferline.nvim",   event = "BufWinEnter", config = function() require("Plugin.source.BufferLine") end },
  { "nvim-lualine/lualine.nvim", event = "BufWinEnter", config = function() require("Plugin.source.LuaLine") end },
  { "lewis6991/gitsigns.nvim",   event = "BufRead" },
  { "sindrets/diffview.nvim",    event = "BufWinEnter" },
  { "akinsho/toggleterm.nvim",   event = "Vimenter",    config = function() require("toggleterm").setup() end },
  { "folke/todo-comments.nvim",  event = "BufReadPre",  config = function() require("todo-comments").setup() end },
  { "numToStr/Comment.nvim", event = "BufReadPre", config = function()
    require("Comment").setup { toggler = { line = "<space>cc", }, opleader = { line = "<space>c", }, }
  end },
  { "ray-x/cmp-treesitter", event = "BufReadPre" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPre",
    config = function() require("Plugin.source.nvim-treesitter") end },
  { "p00f/nvim-ts-rainbow", event = "BufReadPost", },
  "MunifTanjim/nui.nvim",
  cmp,
  Telescope,
  colorscheme,
  ui,
  markdown,
  "junegunn/vim-peekaboo",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "rainbowhxch/beacon.nvim", config = function() require("beacon").setup() end },
  { "nvim-tree/nvim-tree.lua",
    config = function()
      require("Plugin.source.nvim-tree")
    end, event = "VimEnter" },
  { "windwp/nvim-autopairs", config = function()
    require("nvim-autopairs").setup {
      enable_check_bracket_line = false
    }
  end },
  "mg979/vim-visual-multi",
  {
    "glacambre/firenvim",
    build = function() vim.fn["firenvim#install"](0) end
  },
  { "L3MON4D3/LuaSnip", ft = filetypes, config = function()
    require("luasnip.loaders.from_vscode").lazy_load(filetypes)
  end
  },
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "neovim/nvim-lspconfig",
  { "jose-elias-alvarez/null-ls.nvim",
    config = require("Plugin.source.null-ls"), },
}

return Plugins
