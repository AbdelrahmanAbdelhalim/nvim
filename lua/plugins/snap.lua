return {
	"mistricky/codesnap.nvim",
	tag = "v2.0.0", -- Ensure v2 is loaded
	keys = {
		{
			"<leader>ys",
			function()
				local codesnap = require("codesnap")
				local path = os.date("/Users/screbz/dev/youtube/snap/CodeSnap_%Y-%m-%d_%H-%M-%S.png")
                -- Debugging: Check visual selection
                local start_pos = vim.fn.getpos("'<")
                local end_pos = vim.fn.getpos("'>")
                print("Visual selection start:", vim.inspect(start_pos))
                print("Visual selection end:", vim.inspect(end_pos))

				codesnap.save(path)
			end,
			mode = "x",
			desc = "Save code snapshot to disk",
		},
	},
	opts = {
		show_line_number = true, -- This is a top-level option in v2
		snapshot_config = {
			theme = "candy", -- Default theme, can be customized
			background = "#00000000", -- Transparent background
			window = {
				mac_window_bar = false, -- No macbar
				shadow = { radius = 0, color = "#00000000" }, -- To match old config for no shadow
				margin = { x = 0, y = 0 }, -- To match old config for no margin
			},
			watermark = {
				content = "", -- No watermark
			},
		},
	},
}
