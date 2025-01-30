--set up python only file options
vim.api.nvim_create_autocmd("FileType", {
  pattern = "py",
  callback = function(args)
     vim.opt_local.foldmethod="indent"
     vim.opt_local.tabstop="4"
     vim.opt_local.shiftwidth="4"
     vim.opt_local.expandtab=true
  end
})

--tab ordering in godot
vim.api.nvim_create_autocmd("FileType",{
   pattern="gd",
   callback = function(args)
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.expandtab=false
   end
   })

--html syntax highlighting in an njk file
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
   pattern = "*.njk",
   callback = function()
      vim.opt_local.syntax = "html"
   end
})


--set up python only file options
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ts",
  callback = function(args)
     vim.opt_local.tabstop="2"
     vim.opt_local.shiftwidth="2"
     vim.opt_local.expandtab=true
  end
})
