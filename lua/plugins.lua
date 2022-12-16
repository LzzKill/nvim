vim.cmd [[packadd packer.nvim]] -- Loader Packer.nvim

return require("packer").startup({
  function(use)
    -- Libs
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "MunifTanjim/nui.nvim"

    -- View
    use "karb94/neoscroll.nvim"
    use "petertriho/nvim-scrollbar"
    use "lukas-reineke/indent-blankline.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "junegunn/vim-peekaboo"
    use "akinsho/bufferline.nvim"
    use "nvim-lualine/lualine.nvim"
    use 'stevearc/dressing.nvim'
    use "folke/noice.nvim"
    use "smjonas/live-command.nvim"
    use "folke/todo-comments.nvim"
    use "rainbowhxch/beacon.nvim"

    use "wbthomason/packer.nvim" -- Packer
    use "nvim-neo-tree/neo-tree.nvim"
    -- Git
    use "sindrets/diffview.nvim"
    use "lewis6991/gitsigns.nvim"
    use "kdheepak/lazygit.nvim"

    use "s1n7ax/nvim-window-picker"
    use "folke/tokyonight.nvim"
    use {"catppuccin/nvim", as = "catppuccin"}
    use "Shatur/neovim-ayu"

    use "windwp/nvim-autopairs"
    use "voldikss/vim-floaterm"

    use "dhruvasagar/vim-table-mode"
    use "iamcco/mathjax-support-for-mkdp"
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    }
    use "numToStr/Comment.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"
    use {"nvim-telescope/telescope.nvim", tag = "0.1.0"}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use "turbio/bracey.vim"
    use "mg979/vim-visual-multi"
    use {
        "glacambre/firenvim",
        run = function() vim.fn["firenvim#install"](0) end
    }
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "p00f/nvim-ts-rainbow"

    -- Snip
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    -- LSP
    use "folke/trouble.nvim"
    use "ray-x/lsp_signature.nvim"
    use "neovim/nvim-lspconfig"
    use "jose-elias-alvarez/null-ls.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "ray-x/cmp-treesitter"
    use {"glepnir/lspsaga.nvim", branch = "main"}

    -- Debug
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
  end,
  config = {
    max_jobs = 25,
    display = {
      open_fn = function()
        return require("packer.util").float({border = "single"})
      end
    }
  }
})
