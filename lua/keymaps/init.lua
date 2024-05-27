local M = {}

M.setup = function ()
   require("keymaps.movement")
   require("keymaps.folds")
   require("keymaps.terminal")
   require("keymaps.macros")
end

return M
