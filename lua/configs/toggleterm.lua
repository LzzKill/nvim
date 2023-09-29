require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  size = 20,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
   -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})
