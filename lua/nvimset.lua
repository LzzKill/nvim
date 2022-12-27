local nvimSets = function(configs)
  for option, set in pairs(configs) do
    vim.opt[option] = set
  end
end

return nvimSets
