return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
	config = function()
		require('lualine').setup {
			options = {
				theme = "catppuccin",
				section_separators = '',
				component_separators = '|',
			}
		}
	end,
}
