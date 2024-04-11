vim.keymap.set('n','<leader>k',function ()
                  vim.fn.system({
                     "terminator"
                  })
               end)
vim.keymap.set('n','k',":terminal<CR>A")

--start another instance of neovim
vim.keymap.set('n','<leader>n',function ()
   vim.fn.system({
      "terminator",
      "-e",
      "nvim -R " .. vim.api.nvim_buf_get_name(0) --TODO: sanatiaze this file name
   })
end)
