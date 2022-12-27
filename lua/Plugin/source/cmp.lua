local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local resource = require("Plugin.resource")
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
    expand = function(args) require("luasnip").lsp_expand(args.body) end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert {
    ["<A-k>"] = cmp.mapping.scroll_docs(-4),
    ["<A-j>"] = cmp.mapping.scroll_docs(4),
    ["<S-Space>"] = cmp.mapping.complete(),
    ["<A-e>"] = cmp.mapping.abort(),
    ["<A-n>"] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } },
    { { name = "buffer" }, { name = "treesitter" } })
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp.setup.filetype("gitcommit",
  { sources = cmp.config.sources { { name = "buffer" } } })
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = "cmdline" } })
})
