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

require("lazy").setup({})

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
