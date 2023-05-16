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
		}
	},
	config       = function()
		require('telescope').setup {
			defaults = {
				layout_config = {
					vertical = { width = 0.5 }
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					}
				},
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						-- ["<C-h>"] = "which_key"
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
			"<cmd>Telescope find_files<CR>",
			desc = "Find Files",
		},
		{
			"<leader>fg",
			"<cmd> Telescope live_grep<CR>",
			desc = "Grep all files",
		},
		{
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Find recent files",
		},
		{
			"<leader>fd",
			"<cmd>Telescope git_files<cr>",
			desc = "Find project files",
		},
		{
			"<leader>fb",
			"<cmd>Telescope file_browser<cr>",
			desc = "Open File Browser"
		}
	},
	--[[ keys = {

		{ '<leader>?', utils.lazy_require('telescope.builtin').oldfiles,  desc = '[?] Find recently opened files' },
		{ '<leader><space>', require('telescope.builtin').buffers,  desc = '[ ] Find existing buffers' },
		{ '<leader>/', function()
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, desc = '[/] Fuzzily search in current buffer' },
		{ '<leader>gf', require('telescope.builtin').git_files, desc = 'Search [G]it [F]iles' },
		{'<leader>sf', require('telescope.builtin').find_files,  desc = '[S]earch [F]iles' },
		{ '<leader>sh', require('telescope.builtin').help_tags, desc = '[S]earch [H]elp' },
		{'<leader>sw', require('telescope.builtin').grep_string, desc = '[S]earch current [W]ord' },
		{ '<leader>sg', require('telescope.builtin').live_grep,  desc = '[S]earch by [G]rep' },
		{ '<leader>sd', require('telescope.builtin').diagnostics,  desc = '[S]earch [D]iagnostics' },

	}, ]]
}
