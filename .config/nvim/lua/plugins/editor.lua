return {

	-- todo-comments
	-- highlight todo, fix, etc keywords
	{
		"folke/todo-comments.nvim",
		lazy = true,
		cmd = { "TodoTelescope", "TodoTrouble" },
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim"
		},
		config = true,
	}
}
