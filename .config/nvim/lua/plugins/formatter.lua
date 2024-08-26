return {
	"mhartington/formatter.nvim",
	dependencies = { "williamboman/mason.nvim" },
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- installed the required formatters
		local formatters = {
			lua = { "stylua" },
			python = { "black" },
		}

		local mason_registry = require("mason-registry")
		local info_level = vim.log.levels.INFO

		for filetype, formatter_list in pairs(formatters) do
			for _, formatter in ipairs(formatter_list) do
				local package = mason_registry.get_package(formatter)
				if not package:is_installed() then
					local msg = ("[%s] %s formatter was successfully installed for %s"):format(
						"formatter.lua",
						formatter,
						filetype
					)
					vim.notify(msg, info_level, { title = "formatter.lua" })
					package:install()
				end
			end
		end

		--- build formatter config for the installed formatters
		local formatter_config = {}

		for filetype, formatter_list in pairs(formatters) do
			formatter_config[filetype] = {}
			for _, formatter in ipairs(formatter_list) do
				local formatter_module = ("formatter.filetypes.%s"):format(filetype)
				local status, formatter_fn = pcall(require, formatter_module)
				if status then
					if formatter_fn[formatter] then
						table.insert(formatter_config[filetype], formatter_fn[formatter])
					else
						vim.notify(
							("Formatter function not found for %s : %s"):format(filetype, formatter),
							vim.log.levels.ERROR
						)
					end
				else
					vim.notify(
						("Could not load module for %s : %s"):format(filetype, formatter_module),
						vim.log.levels.ERROR
					)
				end
			end
		end

		--- configure plugin to use the installed formatters
		require("formatter").setup({
			filetype = formatter_config,
		})


		--- keymaps
		vim.keymap.set("n", "<leader>f", "<Cmd>Format<CR>", { desc = "Format file" })
		vim.keymap.set("v", "<leader>f", "<Cmd>Format<CR>", { desc = "Format visual selection" })
	end,
}
