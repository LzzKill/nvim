--- [[
---	About mini.nvim
--- ]]
---


require("mini.pairs").setup()

require("mini.diff").setup(
	{
		mappings = {
			apply = 'gh',
			-- Reset hunks inside a visual/operator region
			reset = 'gH',
			-- Hunk range textobject to be used inside operator
			-- Works also in Visual mode if mapping differs from apply and reset
			textobject = 'gh',
			-- Go to hunk range in corresponding direction
			goto_first = '[H',
			goto_prev = '[h',
			goto_next = ']h',
			goto_last = ']H',
		},
	}
)

require("mini.cursorword").setup()
require("mini.icons").setup()
