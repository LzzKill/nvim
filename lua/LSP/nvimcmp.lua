local lspkind = require("lspkind")
local cmp = require("cmp")
local core = require("cmp.core")
local keymap = require("cmp.utils.keymap")

lspkind.init(
    {
        -- DEPRECATED (use mode instead): enables text annotations
        --
        -- default: true
        -- with_text = true,
        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = "symbol_text",
        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = "codicons",
        symbol_map = {
            File = "",
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Method = "",
            Property = "",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            Reference = "",
            Folder = "",
            EnumMember = " ",
            Constant = "",
            Struct = " ",
            Event = " ",
            Operator = "",
            TypeParameter = ""
        }
    }
)
cmp.setup(
    {
        formatting = {
            fields = {"kind", "abbr", "menu"},
            format = lspkind.cmp_format(
                {
                    source_names = {
                        nvim_lsp = "(LSP)",
                        treesitter = "(TS)",
                        emoji = "(Emoji)",
                        path = "(Path)",
                        calc = "(Calc)",
                        luasnip = "(Snippet)",
                        luasnip = "(Snippet)",
                        buffer = "(Buffer)",
                        spell = "(Spell)"
                    },
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        return vim_item
                    end
                }
            )
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<A-k>"] = cmp.mapping.scroll_docs(-4),
                ["<A-j>"] = cmp.mapping.scroll_docs(4),
                ["<S-Space>"] = cmp.mapping.complete(),
                ["<A-e>"] = cmp.mapping.abort(),
                ["<A-n>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }
        ),
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "luasnip"}
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

cmp.setup.cmdline(
    {"/", "?"},
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
        }
    }
)

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
