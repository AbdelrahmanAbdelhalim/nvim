return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "nvim-lua/plenary.nvim" },
		dir = vim.fn.expand("~/.local/share/nvim/lazy/molten-nvim"),
		dev = true,
		build = ":UpdateRemotePlugins",
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "none"
			vim.g.molten_output_win_max_height = 40
			vim.g.molten_auto_open_output = true

			-- Position output window on the right side
			vim.api.nvim_create_autocmd("User", {
				pattern = "MoltenOutputWinOpen",
				callback = function()
					local win = vim.api.nvim_get_current_win()
					local config = vim.api.nvim_win_get_config(win)

					-- Get the current editor dimensions
					local ui = vim.api.nvim_list_uis()[1]
					local editor_width = ui.width
					local editor_height = ui.height

					-- Position window on the right side
					config.col = math.floor(editor_width * 0.55) -- Adjust this ratio as needed
					config.row = 0
					config.width = math.floor(editor_width * 0.45)
					config.height = editor_height

					vim.api.nvim_win_set_config(win, config)
				end,
			})
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		ft = { "python", "markdown" }, -- Load only for relevant file types
		lazy = false,
		opts = {
			default_kernel_name = "python3",
			formats = { "ipynb", "py:percent" },
		},
	},
	{
		"GCBallesteros/NotebookNavigator.nvim",
		keys = {
			{
				"]h",
				function()
					require("notebook-navigator").move_cell("d")
				end,
			},
			{
				"[h",
				function()
					require("notebook-navigator").move_cell("u")
				end,
			},
			{ "<leader>rr", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
			{ "<leader>rn", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
		},
		dependencies = {
			"echasnovski/mini.comment",
			"anuvyklack/hydra.nvim",
		},
		event = "VeryLazy",
	},
}
