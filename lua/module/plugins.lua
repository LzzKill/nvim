local M = {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function() require("config.lualine") end,
		enable = true
	},
	{
		"nvimdev/lspsaga.vim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons", },
		config = function() require("lspsaga").setup({}) end,
		event = "LspAttach"
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		},
		config = function() require("config.nvim-treesitter") end
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function() require("config.hlchunk") end
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"numToStr/Comment.nvim",
		config = function() require("config.comment") end,
		key = { "<space>c", "<space>b", "<space>cc", "<space>cb" }
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false, -- neo-tree will lazily load itself
		cmd = {
			"Neotree",
			"NoetreeFocus",
			"NeoTreeClose",
			"NeotreeShow"
		},
		config = function() require("config.neo-tree") end,
	},
	{ "miversen33/netman.nvim",  config = function() require("netman") end },
	{ "lewis6991/gitsigns.nvim", config = true,                            event = "VeryLazy", cmd = "Gitsigns", },
	{
		"akinsho/toggleterm.nvim",
		branch = "main",
		cmd = {
			"ToggleTerm",
			"TermExec",
			"ToggleTermToggleAll",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualLines",
			"ToggleTermSendVisualSelection",
		},
		config = function() require("config.toggleterm") end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "telescope-fzf-native.nvim", "telescope-ui-select.nvim" },
		config = function() require("config.nvim-telescope") end,
		cmd = "Telescope",
		lazy = true
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function() require("config.catppuccin") end
	},
	{
		"rcarriga/nvim-notify", -- TODO: Self done
		config = function() require("config.notify") end,
		enable = true,
	},
	{ "nvim-lua/plenary.nvim",                    lazy = true },
	{ "junegunn/vim-peekaboo",                    event = "VeryLazy" },
	{ "karb94/neoscroll.nvim",                    event = "BufEnter",    config = function() require("config.neoscroll") end },
	{ "SCJangra/table-nvim",                      ft = "markdown",       config = function() require("config.table-nvim") end },
	{ 'mg979/vim-visual-multi',                   branch = 'master' },
	{ "folke/todo-comments.nvim",                 event = "BufEnter",    config = true, },
	{ "windwp/nvim-autopairs",                    event = "InsertEnter", config = true },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make",        lazy = true },
	{ "nvim-telescope/telescope-ui-select.nvim",  lazy = true },
	{ "folke/lazy.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	require("config.cmp"),
	{ "nvimtools/none-ls.nvim",   config = require("config.none-ls"), },
	{ "neovim/nvim-lspconfig" },
	{ "ray-x/lsp_signature.nvim", config = true },
}

return M
