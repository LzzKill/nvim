local opt = { noremap = true, silent = true }

local normal = function(maps)
  for _, key in ipairs(maps) do
    if not key[3] then key[3] = opt end
    vim.keymap.set('n', key[1], key[2], key[3])
  end
end

return normal

