local null_ls = require("null-ls")

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,

		null_ls.builtins.diagnostics.pylint,
	},
})

-- Autoformat on save if the language server supports it
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client == nil or client.supports_method(client, "textDocument/formatting", 0) == false then
			return
		end

		local group = "lsp_autoformat"
		vim.api.nvim_create_augroup(group, { clear = false })
		vim.api.nvim_clear_autocmds({ group = group, buffer = event.buf })

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = event.buf,
			group = group,
			desc = "LSP format on save",
			callback = function()
				vim.lsp.buf.format({
					buffer = event.buf,
					filter = function(formatting_client)
						return formatting_client.name == "null-ls"
					end,
				})
			end,
		})
	end,
})
