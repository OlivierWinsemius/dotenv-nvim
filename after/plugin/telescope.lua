local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ss', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup {
    pickers = {
        colorscheme = {
            enable_preview = true,
        }
    },
    extensions = {
        project = {
            base_dirs = {
                '~/Developer'
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true, -- default false
        }
    }
}
