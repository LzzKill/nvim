vim.opt.termguicolors = false
require("bufferline").setup {
    options = {
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
                return ""
            end
            return ""
        end,
        indicator = {
            icon = "",
            style = "icon"
        },
        buffer_close_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        numbers = function(opts)
            return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "C:\\Windows\\explorer.exe",
                highlight = "Directory",
                text_align = "left"
            }
        },
        hover = {
            enabled = true,
            delay = 200,
            reveal = {"close"}
        },
        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
                local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
                local info = #vim.diagnostic.get(0, {severity = seve.INFO})
                local hint = #vim.diagnostic.get(0, {severity = seve.HINT})
                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, fg = "#EC5241"})
                end
                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, fg = "#EFB839"})
                end
                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, fg = "#A3BA5E"})
                end
                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, fg = "#7EA9A7"})
                end
                return result
            end
        }
    }
}
