vim.keymap.set('n','<Leader>zm',function ()
   vim.o.foldmethod = "expr"
   vim.o.foldexpr = "v:lua.require('core.fold_methods').multi_string_fold(v:lnum)"
end)
