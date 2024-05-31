return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function () 
      --uncomment if we do not have telescope
      --vim.keymap.set('','<Leader>g',function ()
      --   require('neo-tree.command').execute({
      --      source = "git_status",
      --      position = "float"
      --   })
      --end)
      --require('neo-tree').setup({
      --   sources = { "filesystem", "buffers", "git_status", "symbols" },
      --})
      ntree_command = require('neo-tree.command')
      vim.keymap.set('','<Leader>n',function ()
         ntree_command.execute({
            action="close"
         })
         ntree_command.execute({
            position = "right"
         })
      end)

      vim.keymap.set('','<Leader>o',function ()
         ntree_command.execute({
            action="close"
         })
         ntree_command.execute({
            position = "right",
            source = "buffers"
         })
      end)
    end
}

