local opt = vim.opt
local g = vim.g

require("config.lazy")
require('lualine').setup {
  options = {
    theme = 'rose-pine'
  }
}

opt["tabstop"] = 4
opt["shiftwidth"] = 4
opt.relativenumber = true
opt.number = true
opt.cursorline = true

-- selection with mouse will immediately copy to clipboard
opt.mouse = 'nv'
vim.keymap.set('v', '<LeftRelease>', '"+ygv')

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0

-- disable automatic comment prefix when pressing 'enter' on a commented line
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  desc = "Disable New Line Comment",
})

-- for moving between panes
vim.keymap.set('n', '<C-k>', '<C-w><up>')
vim.keymap.set('n', '<C-j>', '<C-w><down>')
vim.keymap.set('n', '<C-h>', '<C-w><left>')
vim.keymap.set('n', '<C-l>', '<C-w><right>')

-- for scrolling
vim.keymap.set('n', '<down>', '<C-e>')
vim.keymap.set('n','<up>', '<C-y>')

-- set external tab's title to the name of the file being edited
vim.opt.title = true
vim.opt.titlestring = [[%t]]

vim.cmd [[colorscheme rose-pine-moon]]
