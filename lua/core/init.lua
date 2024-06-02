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
  require("core.auto_cmds")
  require("keymaps").setup()
  require("custom.inkscape_summoner")
  --require("core.lsp_config")
end

return M
