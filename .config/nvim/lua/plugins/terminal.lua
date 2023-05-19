-- Toggle Term
return {
	'akinsho/toggleterm.nvim',
	version = "*",
	-- lazy = true,
	config = function()
		require("toggleterm").setup {
			shell = vim.o.shell, -- change the default shell
			persist_size = true,
			size = 15
		}
	end
}
