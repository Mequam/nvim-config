return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = true },
	},
	event = "BufEnter",
	config = function()
		vim.lsp.enable({
			"lua_ls",
		})
      vim.lsp.enable({'pyright'})
      vim.lsp.enable({'ts_ls'})

      --vim.lsp.config("java_language_server",{ cmd={"java-lang-server"} })
      --vim.lsp.enable("java_language_server")
      vim.lsp.enable("jdtls")

		vim.lsp.config("*", { capabilities = vim.lsp.protocol.make_client_capabilities() })


      --basic keymaps for lsp configs
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
       vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>" )
       vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.code_action()<CR>" )
       vim.keymap.set("v", "<C-k>", "<cmd>lua vim.lsp.buf.range_code_action()<CR>" )
       vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" )
       vim.keymap.set("n", "<leader>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>" )
       vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>" )
       vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>" )
       vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>" )
       vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>' )
       vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>' )
       vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>" )

	end,
}
