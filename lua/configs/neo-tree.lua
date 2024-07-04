require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "float",
    width = 35,
    mappings = {
      ["v"] = "open_vsplit",
      ["s"] = "open_split",
      ["l"] = "open",
      ["h"] = "close_node",
      ["<esc>"] = "cancel",
    }
  },
  filesystem = {
    filtered_items = {
      visible = true
    }
  }
})
