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
        use 'vijaymarupudi/nvim-fzf'
        use 'vim-airline/vim-airline'      
        use 'vim-airline/vim-airline-themes'

        use 'kien/rainbow_parentheses.vim'
        use 'dag/vim-fish'
        use 'godlygeek/tabular'
        use 'plasticboy/vim-markdown'
        use 'majutsushi/tagbar'
        use 'rust-lang/rust.vim' 
        use 'suan/vim-instant-markdown'
        use 'iamcco/mathjax-support-for-mkdp'
        use 'iamcco/markdown-preview.vim'
        use 'dhruvasagar/vim-table-mode'
        use 'scrooloose/nerdtree'
        use 'scrooloose/syntastic' 
        use 'jiangmiao/auto-pairs'
        use 'tenfyzhong/CompleteParameter.vim'
        use 'tpope/vim-fugitive'
        use 'francoiscabrol/ranger.vim'
        --[[coc.nvim--]]
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'ycm-core/YouCompleteMe'
        use {'tbodt/deoplete-tabnine', run = './install.sh'}
        use 'yggdroot/indentline'  
        use 'preservim/nerdcommenter'
        use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
        use 'leafgarland/typescript-vim'
        use 'mattn/emmet-vim'
        use 'morhetz/gruvbox'
        use 'yuttie/inkstained-vim'
        use 'sainnhe/gruvbox-material'
        use 'tyrannicaltoucan/vim-quantum'
        use 'mg979/vim-visual-multi'
        use 'Chiel92/vim-autoformat'
        use 'vhdirk/vim-cmake'
        use 'iamcco/coc-spell-check'
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use 'nvim-lua/plenary.nvim'
    end,
    config = {
		max_jobs = 16,
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	}

})
