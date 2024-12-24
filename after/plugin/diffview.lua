vim.keymap.set('n', '<leader>gd', function()
    if next(require('diffview.lib').views) == nil then
        vim.cmd('DiffviewFileHistory')
    else
        vim.cmd('DiffviewClose')
    end
end)

vim.keymap.set("n", "<leader>gfd", "<Cmd>DiffviewFileHistory %<CR>")
vim.keymap.set("n", "<leader>gD", "<Cmd>DiffviewClose<CR>")
