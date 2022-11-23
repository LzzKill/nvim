--[[
--    NeoVim Plugins Lua file
--    All plug from in Github
--    This is by plug to tun(((((((
--    packer.nvim
--
--]]
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(
    {
        function(use)
            -- UI
            use "wbthomason/packer.nvim" -- Packer

            use {
                "kyazdani42/nvim-web-devicons",
                "akinsho/bufferline.nvim",
                "nvim-lualine/lualine.nvim"
            }
            use {
                "ap/vim-css-color", -- CSS Color
                "folke/tokyonight.nvim", -- Color
                "lukas-reineke/indent-blankline.nvim",
                "nvim-neo-tree/neo-tree.nvim",
                "s1n7ax/nvim-window-picker",
                "MunifTanjim/nui.nvim"
            }
            use {
                -- Makedown
                "md-img-paste-devs/md-img-paste.vim",
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
                tag = "0.1.0",
                requires = {{"nvim-lua/plenary.nvim"}}
            }
            use {
                "lewis6991/gitsigns.nvim",
                "kdheepak/lazygit.nvim"
            }
            use "turbio/bracey.vim" --[[预览HTML]]
            use "dag/vim-fish" --Fish
            use "godlygeek/tabular"
            use "dhruvasagar/vim-table-mode"
            use "jiangmiao/auto-pairs"
            use "tenfyzhong/CompleteParameter.vim"
            use "yuttie/inkstained-vim"
            use "tyrannicaltoucan/vim-quantum"
            use "mg979/vim-visual-multi"
            use "nvim-lua/plenary.nvim"
            use {
                "glacambre/firenvim",
                run = function()
                    vim.fn["firenvim#install"](0)
                end
            }
            use "ray-x/lsp_signature.nvim"
            use {
                -- Code Syntax
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate"
            }
            use "p00f/nvim-ts-rainbow"

            use {
                --LSP and LSP Install
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig"
            }
            use {
                -- nvim-cmp : CODEINTELLI
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline"
            }
            use {
                -- Snip
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip"
            }
            use {
                -- NvimDap : DEBUG
                "mfussenegger/nvim-dap",
                "rcarriga/nvim-dap-ui",
                "theHamsta/nvim-dap-virtual-text"
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
