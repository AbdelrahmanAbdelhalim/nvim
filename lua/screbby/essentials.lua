vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.wo.relativenumber = true
vim.opt.statuscolumn = "%s%-4l"

vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = 'none' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = 'none' })
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
