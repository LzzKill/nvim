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
        function()
            -- UI
            use {
                "lukas-reineke/indent-blankline.nvim", -- 拒绝游标卡尺，从我做起
                "nvim-neo-tree/neo-tree.nvim",
                "akinsho/bufferline.nvim",
                "nvim-lualine/lualine.nvim",
                "B4mbus/nvim-headband",
                "kyazdani42/nvim-web-devicons",
                "s1n7ax/nvim-window-picker",
                "MunifTanjim/nui.nvim",
                "goolord/alpha-nvim"
            }
            use "hotoo/pangu.vim" --Markdown
            use {
                "iamcco/markdown-preview.nvim",
                run = function()
                    vim.fn["mkdp#util#install"]()
                end
            }
            use "md-img-paste-devs/md-img-paste.vim"
            use "wbthomason/packer.nvim"
            use "Chiel92/vim-autoformat"
            use "preservim/nerdcommenter" --自动注释代码
            use "theniceboy/vim-leader-mapper"
            use "junegunn/vim-peekaboo"
            use {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.0",
                requires = {{"nvim-lua/plenary.nvim"}}
            }
            use {
                --git
                "lewis6991/gitsigns.nvim",
                "kdheepak/lazygit.nvim"
            }
            use "turbio/bracey.vim" --[[预览HTML]]
            use "dag/vim-fish" --Fish
            use "godlygeek/tabular"
            use "iamcco/mathjax-support-for-mkdp"
            use "dhruvasagar/vim-table-mode"
            use "folke/trouble.nvim"
            use {
                --color
                "Mofiqul/dracula.nvim",
                "folke/tokyonight.nvim",
                --"sainnhe/everforest",
                "ful1e5/onedark.nvim"
            }
            use "jiangmiao/auto-pairs"
            use "tenfyzhong/CompleteParameter.vim"
            use "mattn/emmet-vim"
            use "yuttie/inkstained-vim"
            use "tyrannicaltoucan/vim-quantum"
            use "mg979/vim-visual-multi"
            use "vhdirk/vim-cmake"
            use "nvim-lua/plenary.nvim"
            use "voldikss/vim-floaterm"
            use "ap/vim-css-color" --CSS颜色
            use {
                "glacambre/firenvim",
                run = function()
                    vim.fn["firenvim#install"](0)
                end
            }
            -- LSP
            use "SmiteshP/nvim-navic"
            use "ray-x/lsp_signature.nvim"
            use "onsails/lspkind.nvim"
            use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- 代码高亮
            use {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig"
            }
            use {
                -- nvim-cmp
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/nvim-cmp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",

            }
            use "onsails/lspkind-nvim"
            use "liuchengxu/vista.vim"
            use "folke/lsp-colors.nvim"
            use {
                "glepnir/lspsaga.nvim",
                branch = "main",
                config = function()
                    local saga = require("lspsaga")
                end
            }
            use "mfussenegger/nvim-dap" -- Debug
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
