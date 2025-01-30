-- contains color configuration for neo vim


vim.api.nvim_set_hl(0,"Normal", {guibg=None,ctermbg=None})
vim.api.nvim_set_hl(0,"GitGutterAddInvisible", {ctermbg=None})
vim.api.nvim_set_hl(0,"GitGutterChangeInvisible", {ctermbg=None})
vim.api.nvim_set_hl(0,"GitGutterDeleteInvisible", {ctermbg=None})

vim.api.nvim_set_hl(0,"folded", {ctermbg=00, ctermfg=05})
vim.api.nvim_set_hl(0,"SpellBad", {ctermfg=16})
vim.api.nvim_set_hl(0,"SpellCap", {ctermfg=16})

vim.api.nvim_set_hl(0,"Pmenu", {ctermbg=16, ctermfg=01})
vim.api.nvim_set_hl(0,"PmenuSbar", {ctermfg=05})
vim.api.nvim_set_hl(0,"PmenuSel", {ctermbg=05, ctermfg=16})
vim.api.nvim_set_hl(0,"SpellLocal", {ctermbg=06})
vim.api.nvim_set_hl(0,"SignColumn", {ctermbg=None})
vim.api.nvim_set_hl(0,"Todo", {ctermbg=01, ctermfg=00})
--fix warning messages
vim.api.nvim_set_hl(0,"SpellCap", {ctermbg=05})
--make errors have red background
vim.api.nvim_set_hl(0,"SpellBad", {ctermbg=1})
--pretty line numbers are light oarnge
vim.api.nvim_set_hl(0,"LineNr", {ctermfg=9})
--light oarange
vim.api.nvim_set_hl(0,"type", {ctermfg=11})
--ln cyan
vim.api.nvim_set_hl(0,"PreProc", {ctermfg=14})
--green
vim.api.nvim_set_hl(0,"constant", {ctermfg=10})
--look at me :) (this comments color)
vim.api.nvim_set_hl(0,"comment", {ctermfg=07})
--yellow-orange
vim.api.nvim_set_hl(0,"identifier", {ctermfg=11})
--red-orange
vim.api.nvim_set_hl(0,"statement", {ctermfg=01})

-- search background color
vim.api.nvim_set_hl(0,"search", {ctermbg=17})
-- Sneak highlight color
vim.api.nvim_set_hl(0,"Sneak", {ctermfg=00, ctermbg=03})



--git diff stuff
vim.api.nvim_set_hl(0,"DiffAdd", {ctermbg=01, ctermfg=00})
vim.api.nvim_set_hl(0,"DiffRemoved", {ctermbg=00, ctermfg=01})
vim.api.nvim_set_hl(0,"DiffText", {ctermbg=00, ctermfg=01})
vim.api.nvim_set_hl(0,"DiffChange", {ctermbg=05, ctermfg=00})


vim.cmd 'colorscheme copper'

vim.api.nvim_set_hl(0,"Normal", {guibg=None,ctermbg=None})
vim.api.nvim_set_hl(0,"CursorLine", {gctermbg=none})
