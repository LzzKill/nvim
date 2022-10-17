--[[
--    NeoVim Plugins Lua file
--    All plug from in Github
--    This is by plug to tun(((((((
--    packer.nvim
--
--]]
return require("packer").startup(
    {
        function()
            --[[nvim ui--]]
            --文件管理器
            use "kevinhwang91/rnvimr" --Ranger
            -- 文件管理插件，类似与ranger。
            use {
                "kyazdani42/nvim-tree.lua", --文件树
                requires = {
                    "kyazdani42/nvim-web-devicons" -- optional, for file icons
                }
            }
            use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"} --顶部的Buffer
            use {
                --底部的Line
                "nvim-lualine/lualine.nvim",
                requires = {"kyazdani42/nvim-web-devicons", opt = true}
            }
            --
            -- Markdown
            use "hotoo/pangu.vim"
            -- install without yarn or npm
            use(
                {
                    "iamcco/markdown-preview.nvim",
                    run = function()
                        vim.fn["mkdp#util#install"]()
                    end
                }
            )

            use "md-img-paste-devs/md-img-paste.vim"

            use "wbthomason/packer.nvim" --[[ a good plug chooser, it should know choose itself --]]

            --格式化插件
            use "Chiel92/vim-autoformat"
            use "preservim/nerdcommenter" --自动注释代码

            use "theniceboy/vim-leader-mapper"
            use "junegunn/vim-peekaboo"
            use {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.0",
                requires = {{"nvim-lua/plenary.nvim"}, {"nvim-lua/plenary.nvim"}, {"kdheepak/lazygit.nvim"}}
            }

            use "turbio/bracey.vim" --[[预览HTML]]
            use "kien/rainbow_parentheses.vim"
            use "dag/vim-fish" --Fish
            use "godlygeek/tabular"
            use "simrat39/symbols-outline.nvim"
            use "iamcco/mathjax-support-for-mkdp"
            use "dhruvasagar/vim-table-mode"
            use "ful1e5/onedark.nvim" --OneDark YYDS!!!

            use "jiangmiao/auto-pairs"
            use "tenfyzhong/CompleteParameter.vim"
            --[[自动注释代码]]
            use "yggdroot/indentline"
            use "mattn/emmet-vim"
            --use "sainnhe/gruvbox-material"
            use "yuttie/inkstained-vim"
            use "tyrannicaltoucan/vim-quantum"
            use "mg979/vim-visual-multi"
            use "vhdirk/vim-cmake"
            use "nvim-lua/plenary.nvim"
            use "voldikss/vim-floaterm"
            use "honza/vim-snippets"
            use "ap/vim-css-color" --CSS颜色

            use "leafgarland/typescript-vim" --TypeScript Language
            use {
                "glacambre/firenvim",
                run = function()
                    vim.fn["firenvim#install"](0)
                end
            }

            -- LSP Server
            use {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig"
            }
            -- nvim-cmp
            use {
                "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
                "hrsh7th/cmp-buffer", -- { name = 'buffer' },
                "hrsh7th/cmp-path", -- { name = 'path' }
                "hrsh7th/nvim-cmp"
            }
            -- vsnip
            use "hrsh7th/cmp-vsnip" -- { name = 'vsnip' }
            use "hrsh7th/vim-vsnip"
            use "rafamadriz/friendly-snippets"
            -- lspkind
            use "onsails/lspkind-nvim"
            use "liuchengxu/vista.vim" -- 基于lsp的tag查看器
            use "folke/lsp-colors.nvim"
            use(
                {
                    "glepnir/lspsaga.nvim",
                    branch = "main",
                    config = function()
                        local saga = require("lspsaga")

                        saga.init_lsp_saga({})
                    end
                }
            )

            -- Debug
            use "mfussenegger/nvim-dap"
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
