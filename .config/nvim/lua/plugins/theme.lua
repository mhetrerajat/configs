return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		-- configurations
		local opts = {
			term_colors = true,
			integrations = {
				which_key = true
			}
		}
		require('catppuccin').setup(opts)

		-- set the colorschem
		vim.cmd.colorscheme 'catppuccin-mocha'
	end,
}
