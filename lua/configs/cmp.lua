local resource = require("utils.constant")
return {
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		dependencies = { "friendly-snippets" },
		build = "make install_jsregexp"
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
		config = function()
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.setup({
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						vim_item.kind = resource.file_icons[vim_item.kind]
						vim_item.menu = resource.cmp_names[entry.source.name]
						return vim_item
					end
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered()
				},
				mapping = cmp.mapping.preset.insert {
					["<A-k>"] = cmp.mapping.scroll_docs(-4),
					["<A-j>"] = cmp.mapping.scroll_docs(4),
					["<A-Space>"] = cmp.mapping.complete(),
					["<A-e>"] = cmp.mapping.abort(),
					["<A-n>"] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				},
				sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } },
					{ { name = "buffer" }, { name = "treesitter" }, { name = "nvim_lsp_signature_help" } })
			})

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			cmp.setup.filetype("gitcommit",
				{ sources = cmp.config.sources { { name = "buffer" } } })
		end,
		dependencies = { "cmp-nvim-lsp", "cmp_luasnip", "cmp-buffer" }
	},
	{ "rafamadriz/friendly-snippets", lazy = true },
	{ "hrsh7th/cmp-nvim-lsp",         lazy = true },
	{ "hrsh7th/cmp-buffer",           lazy = true },
	{ "saadparwaiz1/cmp_luasnip",     lazy = true },
}
