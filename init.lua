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

vim.cmd [[colorscheme rose-pine-moon]]
