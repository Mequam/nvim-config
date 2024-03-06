return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function () 
         --ctrl p with telescope plugin
         local telescope = require('telescope.builtin')
         vim.keymap.set('','<C-p>',telescope.find_files)
      end
    }
