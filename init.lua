require("screbby")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.diagnostic.config({
	severity_sort = true,
})

require("lazy").setup("plugins") -- This tells Lazy to load plugins from the 'plugins' directory

-- Configs and Files requiring Telescope
local cp = require("screbby.cp")
vim.keymap.set("n", "<leader>cp", function()
	cp.insert_snippet()
end, { noremap = true, silent = true })

require("FTerm").setup({
	border = "double",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

-- You need to define the colors for these highlights manually
-- or link them to existing ones in your theme.
-- Adjust 'guibg' to match your colorscheme's "darker" shade.
vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#1f2335" }) -- Example dark background
vim.api.nvim_set_hl(0, "Dash", { fg = "#3b4261", bold = true })

-- set the file explorer view
vim.g.netrw_liststyle = 1
vim.g.netrw_sizestyle = "h"
vim.g.netrw_list_hide = "^\\.$"
vim.opt.clipboard = "unnamedplus"
vim.g.netrw_sort_by = "size"
