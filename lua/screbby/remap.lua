vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>a", "^")
vim.keymap.set("v", "<leader>a", "^")

vim.keymap.set("n", "<leader>;", "$")
vim.keymap.set("v", "<leader>;", "$")

vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set("n", "<leader>sf", ":Telescope find_files<CR>")

vim.keymap.set("n", "<leader>ss", ":Telescope live_grep<CR>")

-- Remap to move entire lines in one go up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Deleting Doesn't insert the deleted string in the copy buffer (Beautiful)
vim.keymap.set("x", "p", '"_dp')

vim.keymap.set("n", "<leader>tt", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "$", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
