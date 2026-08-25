vim.env.PATH = vim.fn.expand("~/.local/share/nvim/mason/bin") .. ":" .. vim.env.PATH
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
	ensure_installed = { "go", "gomod", "gowork", "gosum", "lua", "markdown", "markdown_inline" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.tex",
	command = "silent !pdflatex main.tex",
})

vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#1f2335" }) -- Example dark background
vim.api.nvim_set_hl(0, "Dash", { fg = "#3b4261", bold = true })

-- 1. Disable default mappings to stop the collision
vim.g.vimtex_mappings_enabled = 0
local kmap = vim.keymap.set

kmap("n", "<leader>bc", "<cmd>VimtexCompile<cr>", { desc = "VimTeX: Compile" })
kmap("n", "<leader>bv", "<cmd>VimtexView<cr>", { desc = "VimTeX: View PDF" })
kmap("n", "<leader>bs", "<cmd>VimtexStop<cr>", { desc = "VimTeX: Stop Compilation" })
kmap("n", "<leader>be", "<cmd>VimtexErrors<cr>", { desc = "VimTeX: Show Errors" })

vim.g.vimtex_view_method = "zathura" -- Or 'sioyek' / 'skim'
vim.g.vimtex_compiler_method = "latexmk"

vim.g.netrw_liststyle = 1
vim.g.netrw_sizestyle = "h"
vim.g.netrw_list_hide = "^\\.$"
vim.opt.clipboard = "unnamedplus"
vim.g.netrw_sort_by = "size"
vim.opt.clipboard = ""
