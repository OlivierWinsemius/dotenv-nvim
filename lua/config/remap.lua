vim.g.mapleader = " "

vim.keymap.set("n", "<leader>-", vim.cmd.sp)
vim.keymap.set("n", "<leader>|", vim.cmd.vs)

vim.keymap.set("n", "<C-d>", "15jzz")
vim.keymap.set("n", "<C-u>", "15kzz")

vim.keymap.set("n", "<C-[>", "<C-[>:noh<cr>")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
