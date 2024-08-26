-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true


-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true


-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Show which line your cursor is on
vim.opt.cursorline = true


require("config.lazy")


