local if_nil = vim.F.if_nil
local fnamemodify = vim.fn.fnamemodify
local filereadable = vim.fn.filereadable

local default_header = {
    type = "text",
    val = {
    [[     _   _   ___     _____ ____ ___    _      _    ]],
    [[    | | | \ | \ \   / /_ _|  _ \_ _|  / \    | |   ]],
    [[    | | |  \| |\ \ / / | || | | | |  / _ \   | |   ]],
    [[    | | | |\  | \ V /  | || |_| | | / ___ \  | |   ]],
    [[    | | |_| \_|  \_/  |___|____/___/_/   \_\ | |   ]],
    [[    |_|                                      |_|   ]],
    [[  _   _____ _   _  ____ _  ____   _____  _   _   _ ]],
    [[ | | |  ___| | | |/ ___| |/ /\ \ / / _ \| | | | | |]],
    [[ | | | |_  | | | | |   | ' /  \ V / | | | | | | | |]],
    [[ | | |  _| | |_| | |___| . \   | || |_| | |_| | | |]],
    [[ | | |_|    \___/ \____|_|\_\  |_| \___/ \___/  | |]],
    [[ |_|                                            |_|]],
},

    opts = {
        position = "center",
        hl = "Type",
        shrink_margin = false,
        -- wrap = "overflow";
    },
}

local leader = "SPC"
  
--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local button = function(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
  
    local opts = {
        position = "center",
        shortcut = "[>" .. sc .. "<] ",
        cursor = 2,
        width = 50,
        align_shortcut = "left",
        hl_shortcut = { { "Operator", 0, 2 }, { "Number", 2, #sc + 2 }, { "Operator", #sc + 2, #sc + 5 } },
        shrink_margin = false,
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, { noremap = false, silent = true, nowait = true } }
    end
  
    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end
  
    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end
  
local nvim_web_devicons = {
    enabled = true,
    highlight = true,
}

local function get_extension(fn)
    local match = fn:match("^.+(%..+)$")
    local ext = ""
    if match ~= nil then
        ext = match:sub(2)
    end
    return ext
end

local function icon(fn)
    local nwd = require("nvim-web-devicons")
    local ext = get_extension(fn)
    return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn,autocd)
    short_fn = if_nil(short_fn, fn)
    local ico_txt
    local fb_hl = {}
    if nvim_web_devicons.enabled then
        local ico, hl = icon(fn)
        local hl_option_type = type(nvim_web_devicons.highlight)
        if hl_option_type == "boolean" then
            if hl and nvim_web_devicons.highlight then
                table.insert(fb_hl, { hl, 0, 1 })
            end
        end
        if hl_option_type == "string" then
            table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
        end
        ico_txt = ico .. "  "
    else
        ico_txt = ""
    end
    local cd_cmd = (autocd and " | cd %:p:h" or "")
    local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. cd_cmd .." <CR>")
    local fn_start = short_fn:match(".*[/\\]")
    if fn_start ~= nil then
        table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
    end
    file_button_el.opts.hl = fb_hl
    return file_button_el
end

--- @param start number
--- @param cwd string? optional
--- @param items_number number? optional number of items to generate, default = 10
local section = {
    header = default_header,
    top_buttons = {
        type = "group",
    val = {
        button("e", "  New file", "<cmd>ene <CR>"),
        button("r", "  Frecency/MRU"),
        button("f", "  Find file", "<cmd>Telescope find_files <CR>"),
        button("F", "  Find type", "<cmd>Telescope findtypes <CR>"),
        button("h", "  Recently opened files"),
        button("g", "  Find word"),
        button("m", "  Jump to bookmarks"),
        button("l", "  Open last session"),
    },
    },
    bottom_buttons = {
        type = "group",
        val = {
            button("Q", "Quit", "<cmd>q <CR>"),
        },
    },
    footer = {
        type = "group",
        val = {},
    },
}

local config = {
    layout = {
        { type = "padding", val = 1 },
        section.header,
        { type = "padding", val = 2 },
        section.top_buttons,
        { type = "padding", val = 1 },
        section.bottom_buttons,
        section.footer,
    },
    opts = {
        margin = 3,
        redraw_on_resize = false,
        setup = function()
            vim.api.nvim_create_autocmd('DirChanged', {
                pattern = '*',
                callback = function () require('plugins.StartX').redraw() end,
            })
        end,
    },
}

return {
    icon = icon,
    button = button,
    file_button = file_button,
    section = section,
    config = config,
    -- theme config
    nvim_web_devicons = nvim_web_devicons,
    leader = leader,
    -- deprecated
    opts = config,
}
