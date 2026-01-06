local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- npm install -g @fsouza/prettierd
        null_ls.builtins.formatting.prettierd,
        -- brew install stylua
        null_ls.builtins.formatting.stylua,
        -- pip install black
        null_ls.builtins.formatting.black,

        -- npm i -g eslint_d
        null_ls.builtins.diagnostics.eslint_d,
        -- pip install flake8
        null_ls.builtins.diagnostics.flake8,
    },
})
