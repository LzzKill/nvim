return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      background = {
        light = "latte",
        dark = "frappe",
      },
      transparent_background = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        notify = true,
        noice = true,
        neotree = true
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end
}
