_G.context = {}
_G.context.variable = {}

local context = _G.context
local variable = _G.context.variable

context.name = "LimitVim"
context._name = "lim"
context.limit = {}
context.plugins = {}
context.colorsheme = "catppuccin"
---@type "normal" | "fast"
context.mode = "fast"
variable.keymap_mode = "n"

