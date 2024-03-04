-- set the keybindings for the hop plugin
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', '<C-W>', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, {remap=true})

vim.keymap.set('', '<C-S>', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, {remap=true})

vim.keymap.set('', 's', function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = true})
end, {remap=true})

--movement for splits
vim.keymap.set('','<C-UP>',"<C-W><UP>")
vim.keymap.set('','<C-DOWN>',"<C-W><DOWN>")
vim.keymap.set('','<C-RIGHT>',"<C-W><RIGHT>")
vim.keymap.set('','<C-LEFT>',"<C-W><LEFT>")

--vim.keymap.set('', 'T', function()
--  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
--end, {remap=true})

