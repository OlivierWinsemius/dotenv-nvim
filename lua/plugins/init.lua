return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme tokyonight-moon]]
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
    },
    { 'nvim-telescope/telescope-project.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        config = function()
            require('telescope').load_extension('project')
        end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle focus=true<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "sindrets/diffview.nvim" },

    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },

    -- { 'github/copilot.vim' },
    { "alexghergh/nvim-tmux-navigation" },
    { "lewis6991/gitsigns.nvim" },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    }
}
