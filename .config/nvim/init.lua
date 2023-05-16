-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Package Manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

-- Load Configs
require('configs')

local plugins = {
	-- Shows pending keybinds.
	{ 'folke/which-key.nvim', opts = {} },
	{ import = 'plugins' },
}
local opts = {}
require("lazy").setup(plugins, opts)
