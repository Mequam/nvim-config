return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function ()
         --ctrl p with telescope plugin
         local telescope = require('telescope.builtin')
         vim.keymap.set('','<C-p>',telescope.find_files)
         vim.keymap.set('n','gf', function ()
                                    telescope.lsp_references({
                                       fname_width=100
                                    })
                              end
                                 )
         vim.keymap.set('n','gd', function ()
                        telescope.lsp_definitions({opts={
                           fname_width=40
                        }})
         end)

         vim.keymap.set('n','<Leader>b',telescope.buffers)
         vim.keymap.set('n','<Leader>p',telescope.registers)
         vim.keymap.set('n','gs',telescope.git_status)
         vim.keymap.set('n','gh',telescope.git_bcommits)
      end
    }
