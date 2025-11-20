return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "nvim-lua/plenary.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
		end,
	},
	{
		-- see the image.nvim readme for more information about configuring this plugin
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- whatever backend you would like to use
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
	{
		"GCBallesteros/jupytext.nvim",
		ft = { "python", "markdown" }, -- Load only for relevant file types
		lazy = false,
		opts = {
			-- Optional: set default formats for new files
			default_kernel_name = "python3",
			-- Optional: set preferred format (e.g., ipynb, or percent for python scripts)
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
			{ "<leader>r", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
			{ "<leader>t", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
		},
		dependencies = {
			"echasnovski/mini.comment",
			"anuvyklack/hydra.nvim",
		},
		event = "VeryLazy",
	},
	{
		"hkupty/iron.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
