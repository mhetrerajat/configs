-- Highlight, edit, and navigate code
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "vim", "markdown" },
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		indent = { enable = true },
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}