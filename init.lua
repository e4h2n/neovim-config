local opt = vim.opt
local g = vim.g

require("config.lazy")

-- lualine
local custom_rose_pine = require'lualine.themes.rose-pine'
local overlay = '#56526e' -- these names are not accurate to the palatte
local surface = '#2a273f'
local a_text = '#2a283e'

custom_rose_pine.normal.a.bg = '#f6c177'
custom_rose_pine.normal.a.fg = a_text
custom_rose_pine.normal.b.fg = custom_rose_pine.normal.a.bg
custom_rose_pine.normal.b.bg = overlay
custom_rose_pine.normal.c.bg = surface

custom_rose_pine.insert.a.bg = '#3e8fb0'
custom_rose_pine.insert.a.fg = a_text
custom_rose_pine.insert.b.fg = '#9ccfd8'
custom_rose_pine.insert.b.bg = overlay
custom_rose_pine.insert.c.bg = surface

custom_rose_pine.command.a.bg = '#ea9a97'
custom_rose_pine.command.a.fg = a_text
custom_rose_pine.command.b.fg = custom_rose_pine.command.a.bg
custom_rose_pine.command.b.bg = overlay
custom_rose_pine.command.c.bg = surface

custom_rose_pine.replace.a.bg = '#9ccfd8'
custom_rose_pine.replace.a.fg = a_text
custom_rose_pine.replace.b.fg = custom_rose_pine.replace.a.bg
custom_rose_pine.replace.b.bg = overlay
custom_rose_pine.replace.c.bg = surface

custom_rose_pine.visual.a.fg = a_text
custom_rose_pine.visual.b.bg = overlay
custom_rose_pine.visual.c.bg = surface

custom_rose_pine.inactive.a.bg = overlay
custom_rose_pine.inactive.a.fg = '#908caa'
custom_rose_pine.inactive.b.bg = surface
custom_rose_pine.inactive.c.bg = '#2a283e'

local lualine = require('lualine')
lualine.setup {
	options = {
    	theme = custom_rose_pine,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = { 'filename' },
		lualine_x = { 'filetype' },
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = { },
		lualine_x = { 'filetype' },
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
