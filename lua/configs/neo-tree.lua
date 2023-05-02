require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "right",
    width = 35,
    mappings = {
      ["v"] = "open_vsplit",
      ["l"] = "open",
      ["h"] = "close_node",
    }
  },
  filesystem = {
    filtered_items = {
      visible = true
    }
  }
})
