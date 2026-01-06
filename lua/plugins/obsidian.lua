return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "KnowledgeBase",
				path = "~/dev/Brain/", -- Point to your vault root
			},
		},
		templates = { subdir = "990_Templates" },

		-- Daily Notes Configuration
		daily_notes = {
			folder = "00_Daily_Tasks/Daily",
			date_format = "%Y-%m-%d",
			template = "Daily_Note_Template.md",
		},

		-- Keymappings (Optional but recommended)
		mappings = {
			-- "Obsidian Follow Link"
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle checkbox
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},

		-- Optional: Frontmatter management
		disable_frontmatter = true, -- Set to false if you want metadata
	},
}
