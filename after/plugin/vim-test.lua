vim.keymap.set("n", "<leader>t", vim.cmd.TestNearest);
vim.keymap.set("n", "<leader>T", vim.cmd.TestFile);
vim.keymap.set("n", "<leader>a", vim.cmd.TestSuite);
vim.keymap.set("n", "<leader>l", vim.cmd.TestLast);
vim.keymap.set("n", "<leader>g", vim.cmd.TestNearest);

vim.cmd("let test#strategy = 'vimux'");
