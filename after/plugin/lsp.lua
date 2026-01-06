-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

-- brew install lua-language-server
vim.lsp.config("lua_ls", {})
-- brew install rust-analyzer
vim.lsp.config("rust_analyzer", {})
-- brew install python-lsp-server
vim.lsp.config("pylsp", {})
-- npm install -g typescript typescript-language-server
vim.lsp.config("ts_ls", {})
-- npm install -g eslint
vim.lsp.config("eslint", {})
-- ~/Developer/superhtml (from https://github.com/kristoff-it/superhtml/releases)
vim.lsp.config("superhtml", {})
-- brew install llvm
vim.lsp.config("clangd", {})
-- cd ~/Developer/personal/odin/ols && ./build.sh
vim.lsp.config("ols", {})
-- /usr/local/bin/glsl_analyzer (from https://github.com/nolanderc/glsl_analyzer/releases)
vim.lsp.config("glsl_analyzer", {})
-- npm install -g vscode-css-languageserver-bin
vim.lsp.config("cssls", {})
-- brew install cmake-language-server
vim.lsp.config("cmake", {})

vim.lsp.enable({
	"lua_ls",
	"rust_analyzer",
	"pylsp",
	"ts_ls",
	"eslint",
	"superhtml",
	"clangd",
	"ols",
	"glsl_analyzer",
	"cssls",
	"cmake",
})
