-- @Original author's : github: https://github.com/denstiny
-- @License: MIT
-- @Repo: https://github.com/nvim-zh/colorful-winsep.nvim
-- Modified by FZZkill

local api = vim.api
local view = require("modules.winsep.view")
local fn = vim.fn
local M = { lock = false }

function M.NvimSeparatorShow()
  vim.defer_fn(function()
    M.lock = true
    if view.create_dividing_win() then
      view.set_buf_char()
    else
      if view.move_dividing_win() then
        view.set_buf_char()
      end
    end
    M.lock = false
    view.config.create_event()
  end, require("modules.winsep.utils").defaultopts.interval)
end

function M.NvimSeparatorDel()
  view.close_dividing()
  view.config.close_event()
end

function M.setup(opts)
  view.set_config(opts)
  M.auto_group = api.nvim_create_augroup("NvimSeparator", { clear = true })
  if view.config.enable then
    api.nvim_create_autocmd(
      { "WinEnter", "WinScrolled", "VimResized", "WinClosed", "ColorScheme", "ColorSchemePre" },
      {
        group = M.auto_group,
        callback = function(options)
          if M.lock then
            return
          end
          if options.event == "WinClosed" then
            local winnr = fn.bufwinid(options.buf)
            if fn.win_gettype(winnr) == "popup" then
              return
            end
            M.NvimSeparatorDel()
          end
          if options.event == "ColorScheme" or options.event == "WinEnter" then
            view.highlight()
          end
          M.NvimSeparatorShow()
        end,
      }
    )
  end
  api.nvim_create_autocmd({ "WinLeave", "BufModifiedSet" }, {
    group = M.auto_group,
    callback = function(options)
      if ModifiedSet_no_closed_solt(options) then
        return
      end
      M.NvimSeparatorDel()
    end,
  })
  view.start_timer()
end

function ModifiedSet_no_closed_solt(opts)
  if opts.event == "BufModifiedSet" then
    local filetype_lock = false
    for i = 1, #view.config.no_exec_files do
      if view.config.no_exec_files[i] == vim.bo.filetype then
        filetype_lock = true
      end
    end
    if not filetype_lock then
      return true
    end
  end
  if M.lock then
    return true
  else
    return false
  end
end

return M
