return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = true },
	},
	event = "BufEnter",
	config = function()

   local roslynLspPath = "/Users/dkennamer/.bin/roslyn-lsp/content/LanguageServer/neutral/Microsoft.CodeAnalysis.LanguageServer.dll"
   local uv = vim.uv
   local fs = vim.fs
   
   ---xonsh configuration
   vim.filetype.add({
     extension = { xsh = 'xonsh', xonshrc = 'xonsh' },
     filename  = { ['.xonshrc'] = 'xonsh', ['xonshrc'] = 'xonsh' },
   })
   
   local xonsh_python = vim.fn.system('xonsh -c "import sys; print(sys.executable)"'):gsub('%s+$', '')
   local pythonSettings = {
            pythonPath = xonsh_python,
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
   }
   vim.lsp.config('xonsh_lsp', {
     cmd = { 'uvx', '-n', 'xonsh-lsp' },
     filetypes = { 'xonsh' },
     root_markers = {  'xonshrc', '.git' },
     init_options = {
       pythonBackend = 'pyright',

        backendSettings = {
          python = pythonSettings,
        },
     },
     settings = {
       python = pythonSettings,
     },   
  })
   vim.lsp.enable('xonsh_lsp')
   --end xonsh-lsp

        vim.lsp.config("roslyn_ls",{
           cmd = {
             'dotnet',
             roslynLspPath,
             '--logLevel', -- this property is required by the server
             'Information',
             '--extensionLogDirectory', -- this property is required by the server
             fs.joinpath(uv.os_tmpdir(), 'roslyn_ls/logs'),
             '--stdio',
           }
  })


     vim.lsp.config('groovyls', {
         -- Unix
         cmd = { "java", "-jar", "/Users/dkennamer/ProgramingWorkshop/groovy-language-server/build/libs/groovy-language-server-all.jar" }
     })

	  vim.lsp.config("*", { capabilities = vim.lsp.protocol.make_client_capabilities() })
	  vim.lsp.enable('gdscript')

      vim.lsp.enable("groovyls")
      --vim.lsp.enable("csharp_ls")
      vim.lsp.enable("roslyn_ls")
		vim.lsp.enable({
			"lua_ls",
		})
      vim.lsp.enable({'pyright'})
      vim.lsp.enable({'ts_ls'})
      vim.lsp.enable({'cypher_ls'})
      vim.lsp.enable({'codebook'})

      --vim.lsp.config("java_language_server",{ cmd={"java-lang-server"} })
      --vim.lsp.enable("java_language_server")
      vim.lsp.enable("jdtls")

		vim.lsp.config("*", { capabilities = vim.lsp.protocol.make_client_capabilities() })


      --basic keymaps for lsp configs
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>" )
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
