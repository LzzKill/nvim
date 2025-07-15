local telescope = require("telescope")
telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,                         -- false will only do exact matching
			override_generic_sorter = true,       -- override the generic sorter
			override_file_sorter = true,          -- override the file sorter
			case_mode = "smart_case",             -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	},
	["ui-select"] = {
		require("telescope.themes").get_dropdown {
			-- even more opts
		}
	}
})
local telescope_plugins = { "fzf", "ui-select", "notify" }
for _, plugins in ipairs(telescope_plugins) do
	telescope.load_extension(plugins)
end
