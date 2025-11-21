return {
	"rebelot/kanagawa.nvim",
	lazy = false, -- Set to false to load it immediately
	priority = 1000, -- Ensures it loads before other plugins that might depend on it
	config = function()
		require("kanagawa").setup({
			-- compile = true,
			-- transparent = false,
			dimInactive = true,
			-- terminalColors = true,
			-- colors = {
			--   theme = {
			--     wave = {},
			--     dragon = {},
			--     lotus = {},
			--     all = {
			--       ui = {
			--         bg_gutter = "none",
			--       },
			--     },
			--   },
			-- },
		})
		-- Optional: Set the desired Kanagawa theme (e.g., kanagawa-wave, kanagawa-dragon, kanagawa-lotus)
		vim.cmd("colorscheme kanagawa-wave")
	end,
}
