-- similar to VS Code's Command Palette

local keymaps = {
	{ "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Open ToggleTerm" },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",      desc = "Open ToggleTerm (float)" }
}
local commands = {}

return {
	'mrjones2014/legendary.nvim',
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<leader>p", "<cmd>Legendary<cr>", desc = "Open Legendary Command Palette" },
	},
	dependencies = {
		{ "stevearc/dressing.nvim" }
	},
	config = function()
		require("legendary").setup {
			which_key = { auto_register = true },
			keymaps = keymaps,
			commands = commands,
			autocmds = {
				{ 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
			}
		}
	end
}
