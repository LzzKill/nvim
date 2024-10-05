return
    function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          telescope = true,
          notify = true,
          noice = true,
          neotree = true
        },
      })
      -- vim.cmd.colorscheme("catppuccin")
    end
