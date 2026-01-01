return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = true },
	},
	event = "BufEnter",
	config = function()
		vim.lsp.config("*", { capabilities = vim.lsp.protocol.make_client_capabilities() })
		vim.lsp.enable({
			"lua_ls",
		})
	end,
}
