-- similar to VS Code's Command Palette

local keymaps = {
	-- ToggleTerm
	{ "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>",            desc = "Open ToggleTerm" },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",                 desc = "Open ToggleTerm (float)" },

	-- todo-comments
	{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,NOTE<cr>", desc = "Todo/Fix/Fixme/NOTE" },
	{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",        desc = "Todo/Fix/Fixme (Trouble)" },
	{ "<leader>st", "<cmd>TodoTelescope keywords=TODO<cr>",                desc = "Todo" },

	-- Trouble
	{ "<leader>xC", "<cmd>TroubleClose<cr>",                               desc = "Close Trouble Panel" },


	-- Diagnostic keymaps
	{ '[d',         vim.diagnostic.goto_prev,                              desc = "Go to previous diagnostic message" },
	{ ']d',         vim.diagnostic.goto_next,                              desc = "Go to next diagnostic message" },
	{ '<leader>e',  vim.diagnostic.open_float,                             desc = "Open floating diagnostic message" },
	{ '<leader>q',  vim.diagnostic.setloclist,                             desc = "Open diagnostics list" }
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
