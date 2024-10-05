local display = {
	{
		"nvim-lualine/lualine.nvim",
		config = require("limit.configs.lualine"),
		enable = true
	},
	{
		"rcarriga/nvim-notify", -- TODO: Self done
		config = function() require("configs.notify") end,
		enable = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.nvim-treesitter")
		end,
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		}
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({})
		end
	},
	{ "MunifTanjim/nui.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "junegunn/vim-peekaboo",       event = "VeryLazy" },
	{ "karb94/neoscroll.nvim",       event = "BufEnter", config = true },
}

local markdown = {
	{
		"dhruvasagar/vim-table-mode",
		config = function()
			require("configs.vim_table_mode")
		end,
		ft = "markdown"
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = "markdown",
	},
}

local tool = {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta",     lazy = true }, -- optional `vim.uv` typings
	{
		'mg979/vim-visual-multi',
		branch = 'master'
	},
	{ "folke/todo-comments.nvim", event = "BufEnter",    config = true, },
	{ "windwp/nvim-autopairs",    event = "InsertEnter", config = true },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<space>cc",
					block = "<space>bc"
				},
				opleader = {
					line = "<space>c",
					block = "<space>b"
				}
			})
		end,
		key = { "<space>c", "<space>b" }
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = function()
			require("configs.neo-tree")
		end,
		cmd = { "Neotree", "NoetreeFocus", "NeoTreeClose", "NeotreeShow" },
		key = { "<A-f>" },
		event = "User DirOpened",
	},
	{ "lewis6991/gitsigns.nvim", config = true, event = "VeryLazy", cmd = "Gitsigns", },
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
		config = function() require("configs.toggleterm") end,
	},
	{ "nvim-lua/plenary.nvim",   lazy = true },
}

return {
	"folke/lazy.nvim",
	require("configs.cmp"),
	{ "nvimtools/none-ls.nvim", config = require("configs.none-ls"), },
	{ "neovim/nvim-lspconfig" },
	require("configs.nvim-telescope"),
	display,
	require("configs.catppuccin"),
	{"ray-x/lsp_signature.nvim", config = true},
	-- { "lzzkill/tag.nvim", dev = true, config = true },
	-- { "lzzkill/dp_signature.nvim", dev = true, config = true },
	tool,
	markdown
}
