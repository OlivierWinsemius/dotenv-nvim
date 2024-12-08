return {
    {
        "folke/tokyonight.nvim",
        lazy=false,
        priority=1000,
        config=function()
            vim.cmd[[colorscheme tokyonight-moon]]
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        lazy=false,
    },
    { 'nvim-telescope/telescope-project.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        config=function()
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
    -- { "sunjon/shade.nvim" },
    -- lsp-zero
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },

    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/vscode-langservers-extracted'},

    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    -- lsp-zero end

    { 'github/copilot.vim' },
    { "alexghergh/nvim-tmux-navigation"},
    { "lewis6991/gitsigns.nvim" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    { "vim-test/vim-test",
        dependencies = {
            "preservim/vimux",
        },
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/vaults/personal",
                },
                {
                    name = "work",
                    path = "~/vaults/work",
                },
            },

            -- see below for full list of options 👇
        },
    },
}
