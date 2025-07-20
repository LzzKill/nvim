require("lspsaga").setup({
	ui = {
		title = true,
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		kind = {},
	},
	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		hide_keyword = false,
		show_file = true,
		folder_level = 1,
		color_mode = true,
	},
	lightbulb = {
		enable = true,
		sign = true,
		virtual_text = false,
	},
	diagnostic = {
		jump_num_shortcut = true,
		max_width = 0.7,
		max_height = 0.6,
		text_hl_follow = true,
		keys = {
			exec_action = "o",
			quit = "q",
			go_action = "g"
		},
		lightbulb = {
			enable = true,
			sign = false,
			virtual_text = true,
			debounce = 0
		}
	}
})
