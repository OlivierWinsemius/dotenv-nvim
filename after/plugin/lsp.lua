-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

vim.diagnostic.config({ { update_in_insert = true } })

local buffer_autoformat = function(bufnr)
    local group = 'lsp_autoformat'
    vim.api.nvim_create_augroup(group, { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        group = group,
        desc = 'LSP format on save',
        callback = function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end,
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local id = vim.tbl_get(event, 'data', 'client_id')
        local client = id and vim.lsp.get_client_by_id(id)
        if client == nil then
            return
        end

        if client.supports_method('textDocument/formatting') then
            buffer_autoformat(event.buf)
        end
    end
})

require('lspconfig').lua_ls.setup({})
-- brew install rust-analyzer
require('lspconfig').rust_analyzer.setup({})
-- brew install python-lsp-server
require('lspconfig').pylsp.setup({})
-- npm install -g typescript typescript-language-server
require('lspconfig').ts_ls.setup({})
-- npm install -g eslint
require('lspconfig').eslint.setup({})
-- ~/Developer/superhtml (from https://github.com/kristoff-it/superhtml/releases)
require('lspconfig').superhtml.setup({})
-- brew install llvm
require('lspconfig').clangd.setup({})
-- cd ~/Developer/personal/odin/ols && ./build.sh
require('lspconfig').ols.setup({})
-- /usr/local/bin/glsl_analyzer (from https://github.com/nolanderc/glsl_analyzer/releases)
require('lspconfig').glsl_analyzer.setup({})
-- npm install -g vscode-css-languageserver-bin
require('lspconfig').cssls.setup({})
-- brew install cmake-language-server
require('lspconfig').cmake.setup({})

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})
