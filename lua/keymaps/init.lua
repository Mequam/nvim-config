local M = {}

M.setup = function ()
   require("keymaps.movement")
   require("keymaps.folds")
   require("keymaps.terminal")
   require("keymaps.macros")


   vim.keymap.set("n",'<leader>s',':CocOutline<cr><DOWN><C-UP>',{nowait=true,remap=true})
   vim.keymap.set("n",'<leader>w','<leader>n<C-LEFT><leader>s',{remap=true})
end

return M
