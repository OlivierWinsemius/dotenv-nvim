vim.keymap.set("n", "<leader>gd", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end)

vim.keymap.set("n", "<leader>gD", "<Cmd>DiffviewFileHistory<CR>")
vim.keymap.set("n", "<leader>gfd", "<Cmd>DiffviewFileHistory %<CR>")
