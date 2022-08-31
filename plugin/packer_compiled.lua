-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/fzzkill/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/fzzkill/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/fzzkill/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/fzzkill/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/fzzkill/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["CompleteParameter.vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/CompleteParameter.vim",
    url = "https://github.com/tenfyzhong/CompleteParameter.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["bracey.vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/bracey.vim",
    url = "https://github.com/turbio/bracey.vim"
  },
  ["coc-spell-checker"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/coc-spell-checker",
    url = "https://github.com/iamcco/coc-spell-checker"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["deoplete-tabnine"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/deoplete-tabnine",
    url = "https://github.com/tbodt/deoplete-tabnine"
  },
  ["deoplete.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/deoplete.nvim",
    url = "https://github.com/Shougo/deoplete.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  indentline = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/indentline",
    url = "https://github.com/yggdroot/indentline"
  },
  ["inkstained-vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/inkstained-vim",
    url = "https://github.com/yuttie/inkstained-vim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/markdown-preview.vim",
    url = "https://github.com/iamcco/markdown-preview.vim"
  },
  ["mathjax-support-for-mkdp"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/mathjax-support-for-mkdp",
    url = "https://github.com/iamcco/mathjax-support-for-mkdp"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pangu.vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/pangu.vim",
    url = "https://github.com/hotoo/pangu.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/rainbow_parentheses.vim",
    url = "https://github.com/kien/rainbow_parentheses.vim"
  },
  ["ranger.vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/ranger.vim",
    url = "https://github.com/francoiscabrol/ranger.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  syntastic = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/syntastic",
    url = "https://github.com/scrooloose/syntastic"
  },
  tabular = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-autoformat",
    url = "https://github.com/Chiel92/vim-autoformat"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-cmake",
    url = "https://github.com/vhdirk/vim-cmake"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-css-color",
    url = "https://github.com/ap/vim-css-color"
  },
  ["vim-fish"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-fish",
    url = "https://github.com/dag/vim-fish"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-instant-markdown"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-instant-markdown",
    url = "https://github.com/suan/vim-instant-markdown"
  },
  ["vim-leader-mapper"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-leader-mapper",
    url = "https://github.com/theniceboy/vim-leader-mapper"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-peekaboo",
    url = "https://github.com/junegunn/vim-peekaboo"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-quantum"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-quantum",
    url = "https://github.com/tyrannicaltoucan/vim-quantum"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
