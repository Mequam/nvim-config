return {
  "neoclide/coc.nvim",
  branch = "master",
  --build = "npm ci", --this needs to run after install, but doesn't for some reason, so run it yourself after install
  config = function ()
     function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
     end

      -- Always show the signcolumn, otherwise it would shift the text each time
      -- diagnostics appeared/became resolved
      vim.opt.signcolumn = "yes"
     
      -- Use Tab for trigger completion with characters ahead and navigate
      -- NOTE: There's always a completion item selected by default, you may want to enable
      -- no select by setting `"suggest.noselect": true` in your configuration file
      -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
      -- other plugins before putting this into your config
      local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
      --vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
      --vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      vim.keymap.set("i", "<TAB>", [[coc#pum#visible() ? coc#pum#confirm() : "<TAB>"]], opts)

      -- Use <c-j> to trigger snippets
      vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
      -- Use <c-space> to trigger completion
      vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

      vim.keymap.set("","<C-_>",":CocList -A outline<CR>",{noremap=true})
      vim.keymap.set("","<Leader><C-_>",":CocList -A symbols<CR>",{noremap=true})


      vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
         pattern = "*.ts",
         callback = function(args)
            vim.keymap.set("n","gd",":CocCommand tsserver.goToSourceDefinition<CR>",{noremap=true})
         end
      })
end

}
