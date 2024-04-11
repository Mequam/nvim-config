local M = {}


M.setup = function()
   require("core.options")
   local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
   if not vim.loop.fs_stat(lazypath) then
     vim.fn.system({
       "git",
       "clone",
       "--filter=blob:none",
       "https://github.com/folke/lazy.nvim.git",
       "--branch=stable", -- latest stable release
       lazypath,
     })
   end
   vim.opt.rtp:prepend(lazypath)
  require("lazy").setup("plugins")
  require("core.colors")
  require("keymaps.movement")
  require("keymaps.folds")
  require("keymaps.terminal")
  require("core.auto_cmds")
  
  --require("core.lsp_config")
end

return M
