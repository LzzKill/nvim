require("limit.limit")

function _G.context.limit:load()
  require("basic.Keymap")
  require("limit.modules.vimoption")
  require("basic.Lazy")
  require("modules.welcome")
  require("modules.toggleterm")
  -- vim.api.nvim_create_user_command("LimitReset", function () require("limit.modules.reset") end, {})
end

_G.context.limit:load()
vim.cmd.colorscheme(_G.context.colorsheme)

