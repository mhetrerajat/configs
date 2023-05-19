-- Fuzzy Finder (files, lsp, etc)
return {
	'nvim-telescope/telescope.nvim',
	branch       = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{
			"nvim-telescope/telescope-file-browser.nvim",
		},
		'sharkdp/fd',

	},
	config       = function()
		require('telescope').setup {
			defaults = {
				layout_config = {
					vertical = { width = 0.5 }
				},
				pickers = {
					find_files = {
						layout_strategy = "vertical",
						theme = "dropdown",
						hidden = true,
						attach_mappings = function(_)
							require("telescope.actions.set").select:enhance({
								post = function()
									vim.cmd(":normal! zx")
								end,
							})
							return true
						end
					}
				},
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key"
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					file_browser = {

					}
				},
			},
		}

		-- Enable telescope extensions
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'file_browser')
	end,
	keys         = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files theme=dropdown<CR>",
			desc = "Find Files",
		},
		{
			"<leader>fg",
			"<cmd> Telescope live_grep theme=dropdown<CR>",
			desc = "Grep all files",
		},
		{
			"<leader>fr",
			"<cmd>Telescope oldfiles theme=dropdown<cr>",
			desc = "Find recent files",
		},
		{
			"<leader>fd",
			"<cmd>Telescope git_files theme=dropdown<cr>",
			desc = "Find project files",
		},
		{
			"<leader>fb",
			"<cmd>Telescope file_browser theme=dropdown<cr>",
			desc = "Open File Browser"
		}
	},
}
