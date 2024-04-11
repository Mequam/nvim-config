-- set the keybindings for the hop plugin
local hop = require('hop')
local directions = require('hop.hint').HintDirection

--hop down
vim.keymap.set('', '<C-W>', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, {remap=true})
--still include window functionality
vim.keymap.set('n','<leader>w','<C-W>')

--hop up
vim.keymap.set('', '<C-S>', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, {remap=true})

vim.keymap.set('', 's', function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = true})
end, {remap=true})

--movement for splits
vim.keymap.set('n','<leader><UP>',"<C-W><UP>")
vim.keymap.set('n','<leader><DOWN>',"<C-W><DOWN>")
vim.keymap.set('n','<leader><RIGHT>',"<C-W><RIGHT>")
vim.keymap.set('n','<leader><LEFT>',"<C-W><LEFT>")

--ctrl movement for splits
vim.keymap.set('n','<C-UP>',"<C-W><UP>")
vim.keymap.set('n','<C-DOWN>',"<C-W><DOWN>")
vim.keymap.set('n','<C-RIGHT>',"<C-W><RIGHT>")
vim.keymap.set('n','<C-LEFT>',"<C-W><LEFT>")

--tab motion
vim.keymap.set('n','<TAB>',":tabn<CR>")
