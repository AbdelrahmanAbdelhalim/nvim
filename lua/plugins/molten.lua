return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "nvim-lua/plenary.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "none"
			vim.g.molten_output_win_max_height = 40
			vim.g.molten_auto_open_output = true
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
