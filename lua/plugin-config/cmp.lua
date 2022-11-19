local lspkind = require("lspkind")
local cmp = require("cmp")
local source_names = {
    nvim_lsp = "(LSP)",
    treesitter = "(TS)",
    emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    luasnip = "(Snip)",
    buffer = "(Buffer)",
    spell = "(Spell)"
}
local source_icons = {
    File = "",
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
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

cmp.setup(
    {
        formatting = {
            fields = {"kind", "abbr", "menu"},
            format = function(entry, vim_item)
                vim_item.kind = source_icons[vim_item.kind]
                vim_item.menu = source_names[entry.source.name]
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
