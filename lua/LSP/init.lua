require("mason").setup(
    {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
)

-- cmp
local cmp = require "cmp"
cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        window = {},
        mapping = cmp.mapping.preset.insert(
            {
                ["<A-j>"] = cmp.mapping.scroll_docs(-4),
                ["<A-k>"] = cmp.mapping.scroll_docs(4),
                ["<S-Space>"] = cmp.mapping.complete(),
                ["<A-e>"] = cmp.mapping.abort(),
                ["<A-n>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }
        ),
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "vsnip"} -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            },
            {
                {name = "buffer"}
            }
        )
    }
)

-- Set configuration for specific filetype.
cmp.setup.filetype(
    "gitcommit",
    {
        sources = cmp.config.sources(
            {
                {name = "cmp_git"} -- You can specify the `cmp_git` source if you were installed it.
            },
            {
                {name = "buffer"}
            }
        )
    }
)

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    {"/", "?"},
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
        }
    }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ":",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)
-- Loader LSP Server
require("LSP/Server")


--重写插件方法,为了实现function 后,自动追加()
local core = require('cmp.core')
local keymap = require('cmp.utils.keymap')
--local cmp_confirm = cmp.confirm
cmp.confirm =  function(option)
	option = option or {}
	local e = core.menu:get_selected_entry() or (option.select and core.menu:get_first_entry() or nil)
	if e then
		core.confirm(e, {
			behavior = option.behavior,
		}, function()
			local myContext  =	core.get_context({ reason = cmp.ContextReason.TriggerOnly })
			core.complete(myContext)
			--function() 自动增加()
			if e and e.resolved_completion_item and (e.resolved_completion_item.kind==3 or e.resolved_completion_item.kind==2) then
				vim.api.nvim_feedkeys(keymap.t('()<Left>'), 'n', true)
			end
		end)
		return true
	else
		return false
	end
end


