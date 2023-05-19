return {
	-- comment neovim plugins
	'numToStr/Comment.nvim',
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = function()
		require('Comment').setup()
	end
}
