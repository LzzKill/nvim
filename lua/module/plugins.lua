local add = require('mini.deps').add
local later = require('mini.deps').later
local now = require('mini.deps').now

add({ source = "echasnovski/mini.nvim" })

-- Lib
add({ source = "nvim-lua/plenary.nvim", name = "plenary.nvim", lazy = true })
add({ source = "MunifTanjim/nui.nvim", name = "nui.nvim", lazy = true })
add({ source = "kyazdani42/nvim-web-devicons", name = "nvim-web-devicons", lazy = true })
add({ source = "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true })
add({ source = "nvim-telescope/telescope-ui-select.nvim", lazy = true })
add({ source = "miversen33/netman.nvim", name = "netman", lazy = true })

add({ source = "catppuccin/nvim", name = "catppuccin", priority = 1000 })
now(function() require("config.catppuccin") end)

add({ source = "nvim-lualine/lualine.nvim", depends = { "nvim-web-devicons" } })
now(function() require("config.lualine") end)

add({
	source = "nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	depends = { "plenary.nvim", "nvim-web-devicons", "nui.nvim", "netman" },
})
later(function() require("config.neo-tree") end)

add({
	source = "nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	ft = { "lua", "c", "cpp", "ixx", "python" }
}
)
later(function() require("config.nvim-treesitter") end)

add({ source = "shellRaining/hlchunk.nvim", lazy = true })
later(function() require("config.hlchunk") end)

-- Markdown 预览
add({
	source = "iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	build = function() vim.fn["mkdp#util#install"]() end,
})

add({ source = "numToStr/Comment.nvim", lazy = true })
later(function() require("config.comment") end)

add({ source = "lewis6991/gitsigns.nvim", lazy = true })
later(function() require('gitsigns').setup() end)

add({ source = "akinsho/toggleterm.nvim", branch = "main", lazy = true })
later(
	function()
		require("config.toggleterm")
		require("module.toggleterm")
	end)

-- 模糊查找
add({
	source = "nvim-telescope/telescope.nvim",
	depends = { "telescope-fzf-native.nvim", "telescope-ui-select.nvim" },
	lazy = true
})
later(function() require("config.nvim-telescope") end)

add({ source = "rcarriga/nvim-notify" })
later(function() require("config.notify") end)

add({
	source = "folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
	lazy = true
})

add({ source = "junegunn/vim-peekaboo", lazy = true })

add({ source = "karb94/neoscroll.nvim", lazy = true })
later(function() require("config.neoscroll") end)

add({ source = "SCJangra/table-nvim", ft = "markdown", lazy = true })
later(function() require("config.table-nvim") end)

add({ source = "mg979/vim-visual-multi", branch = "master" })

add({ source = "folke/todo-comments.nvim", lazy = true })
later(function() require('todo-comments').setup() end)

add({ source = "windwp/nvim-autopairs", lazy = true })
later(function() require('nvim-autopairs').setup() end)


add({ source = "neovim/nvim-lspconfig" })
add({ source = "ray-x/lsp_signature.nvim" })
add({ source = "nvimdev/lspsaga.nvim", depends = { "nvim-treesitter", "nvim-web-devicons" }, lazy = true })
add({ source = "nvimtools/none-ls.nvim", lazy = true })
later(function() require("config.lspsaga") end)
later(function() require('lsp_signature').setup() end)
later(function() require("config.none-ls") end)

add({ source = "rafamadriz/friendly-snippets", lazy = true })
add({ source = "hrsh7th/cmp-nvim-lsp", lazy = true })
add({ source = "hrsh7th/nvim-cmp", lazy = true })
add({ source = "hrsh7th/cmp-buffer", lazy = true })
add({ source = "saadparwaiz1/cmp_luasnip", lazy = true })
later(function() require("config.cmp") end)
