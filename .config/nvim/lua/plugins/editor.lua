return {

	-- todo-comments
	-- highlight todo, fix, etc keywords
	{
		"folke/todo-comments.nvim",
		lazy = true,
		cmd = { "TodoTelescope", "TodoTrouble" },
		event = { "BufReadPost", "BufNewFile", "BufAdd" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim"
		},
		config = true,
	},

	-- gitsigns
	-- git decorations
	{
		'lewis6991/gitsigns.nvim',
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = function()
			require('gitsigns').setup()
		end
	},

	-- indent-blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "BufReadPost",
		config = function()
			vim.opt.list = true
			require('indent_blankline').setup {
				show_current_context = true,
				show_current_context_start = true,
				show_end_of_line = true,
			}
		end
	}
}
