--[[
--    NeoVim Plugins Lua file
--    All plug from in Github
--    This is by plug to tun(((((((
--    packer.nvim
--
--]]

vim.cmd[[packadd packer.nvim]]

return require('packer').startup( {

    function()
        use 'wbthomason/packer.nvim'  --[[ a good plug chooser, it should know choose itself --]]

        use 'liuchengxu/vista.vim' -- 基于lsp的tag查看器

        --文件管理器
        use 'kevinhwang91/rnvimr' --Ranger
        use {
            'kyazdani42/nvim-tree.lua', --文件树
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }

        --格式化插件
        use 'prettier/vim-prettier' --Prettier
        use 'Chiel92/vim-autoformat'
        use 'preservim/nerdcommenter' --自动注释代码

        --p
        --美化
        use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --顶部的Buffer
        use { --底部的Line
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        
        use 'theniceboy/vim-leader-mapper'
        use 'junegunn/vim-peekaboo'
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        
        use 'turbio/bracey.vim'  --[[预览HTML]]
        use 'kien/rainbow_parentheses.vim'
        use 'dag/vim-fish' --Fish
        use 'godlygeek/tabular'
        use 'plasticboy/vim-markdown' --MarkDown File
        use 'simrat39/symbols-outline.nvim'
        use 'suan/vim-instant-markdown'
        use 'iamcco/mathjax-support-for-mkdp'
        use 'iamcco/markdown-preview.vim'
        use 'dhruvasagar/vim-table-mode'

        

        use 'jiangmiao/auto-pairs'
        use 'tenfyzhong/CompleteParameter.vim'
        use 'tpope/vim-fugitive' --Git
        --[[自动注释代码]]
        use 'yggdroot/indentline'  
        use 'mattn/emmet-vim'
        use 'sainnhe/gruvbox-material'
        use 'yuttie/inkstained-vim'
        use 'tyrannicaltoucan/vim-quantum'
        use 'mg979/vim-visual-multi'
        use 'vhdirk/vim-cmake'
        use 'iamcco/coc-spell-checker'
        use 'nvim-lua/plenary.nvim'
        use 'voldikss/vim-floaterm'
        use 'honza/vim-snippets'
        use 'ap/vim-css-color' --CSS颜色
        use 'hotoo/pangu.vim'

        use {'neoclide/coc.nvim', branch = 'release'} -- coc.nvim
        use 'leafgarland/typescript-vim'  --TypeScript Language
        use {
            'glacambre/firenvim',
            run = function() vim.fn['firenvim#install'](0) end 
            }
    end,
    config = {
        max_jobs = 25,
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    }

})
