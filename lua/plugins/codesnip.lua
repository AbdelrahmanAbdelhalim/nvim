return {
	{
		"mistricky/codesnap.nvim",
		build = "make",
		tag = "v1.2.0",
		event = "BufReadPost", -- Load after opening any buffer
		keys = {
			{ "<leader>yc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Copy code snapshot to clipboard" },
			{ "<leader>ys", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save code snapshot to disk" },
		},
		opts = {
			save_path = "~/.snip.png",
			has_line_number = true,
			mac_window_bar = false,
		},
	},
}
