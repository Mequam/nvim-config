vim.api.nvim_create_autocmd("FileType", {
  pattern = "py",
  callback = function(args)
     vim.opt_local.foldmethod="indent"
     vim.opt_local.tabstop="4"
     vim.opt_local.shiftwidth="4"
     vim.opt_local.expandtab=true
  end
})
