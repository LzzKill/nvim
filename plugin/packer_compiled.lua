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
  YouCompleteMe = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/YouCompleteMe",
    url = "https://github.com/ycm-core/YouCompleteMe"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["coc-spell-check"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/coc-spell-check",
    url = "https://github.com/iamcco/coc-spell-check"
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
  nerdtree = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/scrooloose/nerdtree"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/nvim-fzf",
    url = "https://github.com/vijaymarupudi/nvim-fzf"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
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
  ["rust.vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
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
  tagbar = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
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
  ["vim-fish"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-fish",
    url = "https://github.com/dag/vim-fish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-instant-markdown"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-instant-markdown",
    url = "https://github.com/suan/vim-instant-markdown"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-quantum"] = {
    loaded = true,
    path = "/home/fzzkill/.local/share/nvim/site/pack/packer/start/vim-quantum",
    url = "https://github.com/tyrannicaltoucan/vim-quantum"
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
