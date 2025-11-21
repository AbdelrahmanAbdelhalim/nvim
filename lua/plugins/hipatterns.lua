return {
	"echasnovski/mini.hipatterns",
	event = "VeryLazy",
	dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
	config = function()
		-- 1. Define the custom highlight group (Dark Grey background)
		vim.api.nvim_set_hl(0, "NotebookCell", { bg = "#3b4261", bold = true })

		-- 2. Setup mini.hipatterns with a manual pattern
		require("mini.hipatterns").setup({
			highlighters = {
				cells = {
					-- Match lines starting with '# %%'
					-- Lua pattern explanation:
					-- ^       = Start of line
					-- #       = Literal hash
					-- %s      = Space
					-- %%%%    = Two literal percent signs (escaped)
					-- .* = The rest of the line
					pattern = "^# %%%%.*",
					group = "NotebookCell",
				},
			},
		})
	end,
}
