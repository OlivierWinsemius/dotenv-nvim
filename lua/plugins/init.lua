return {
    -- colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function() vim.cmd [[colorscheme tokyonight-moon]] end,
    },

    -- lazydev.nvim: Enhanced Lua development experience
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    -- diagnostics list and more
    {
        "folke/trouble.nvim",
        opts = {},
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
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
            {
                "<leader>xq",
                "<cmd>TroubleToggle quickfix<cr>",
                desc = "Toggle Quickfix List (Trouble)",
            },
        },
    },

    -- completion engine
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },

    -- telescope.nvim: Highly extendable fuzzy finder over lists
    { 'nvim-telescope/telescope-project.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        config = function() require('telescope').load_extension('project') end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- treesitter (syntax highlighting and code understanding)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "OXY2DEV/markview.nvim" },
        lazy = false

    },

    -- git integration
    { "tpope/vim-fugitive" },
    { "sindrets/diffview.nvim" },
    { "lewis6991/gitsigns.nvim" },

    -- lsp (language server protocol) configuration
    { 'neovim/nvim-lspconfig' },
    { 'nvimtools/none-ls.nvim' },

    -- file explorer
    { 'stevearc/oil.nvim',              dependencies = { "echasnovski/mini.icons" } },

    -- other plugins
    { "mbbill/undotree" },
    { 'github/copilot.vim' },
    { "xiyaowong/transparent.nvim",     lazy = false },
    { "alexghergh/nvim-tmux-navigation" },
    { 'kevinhwang91/nvim-ufo',          dependencies = { 'kevinhwang91/promise-async' } },
}
