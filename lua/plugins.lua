vim.cmd[[packadd packer.nvim]] -- Loader Packer.nvim
return require("packer").startup(
{
    function(use)
        use "wbthomason/packer.nvim" -- Packer
        use "nvim-lua/plenary.nvim"
        use "kyazdani42/nvim-web-devicons"
        use {
            "akinsho/bufferline.nvim",
            "nvim-lualine/lualine.nvim"
        }
        use "windwp/nvim-autopairs" --括号自动补全
        use {
            "ap/vim-css-color", -- CSS Color
            "folke/tokyonight.nvim", -- Color
            "lukas-reineke/indent-blankline.nvim",
            "nvim-neo-tree/neo-tree.nvim",
            "s1n7ax/nvim-window-picker",
            "MunifTanjim/nui.nvim"
        }
        use "dhruvasagar/vim-table-mode"
        use {
            "iamcco/mathjax-support-for-mkdp",
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end
        }
        use "Chiel92/vim-autoformat"
        use "preservim/nerdcommenter"
        use "junegunn/vim-peekaboo"
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.0"
        }
        use {
            "lewis6991/gitsigns.nvim",
            "kdheepak/lazygit.nvim"
        }
        use "turbio/bracey.vim" --[[预览HTML]]
        use "mg979/vim-visual-multi"
        use {
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
            end
        }
        use "ray-x/lsp_signature.nvim"
        use {
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate"
            },
            "p00f/nvim-ts-rainbow"
        }
        use "neovim/nvim-lspconfig"
        use {
            "hrsh7th/nvim-cmp", -- Core
            "hrsh7th/cmp-nvim-lsp", -- LSP
            "hrsh7th/cmp-buffer", -- Buffer
            "hrsh7th/cmp-path", -- Path
            "hrsh7th/cmp-cmdline", -- CmdLine
            "saadparwaiz1/cmp_luasnip", -- LuaSnip
            "ray-x/cmp-treesitter"
        }
        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"
        use {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        }
        use {"glepnir/lspsaga.nvim", branch = "main"} -- Update LSP
    end,
    config = {
        max_jobs = 25,
        display = {
            open_fn = function()
                return require("packer.util").float({border = "single"})
            end
        }
    }
}
)
