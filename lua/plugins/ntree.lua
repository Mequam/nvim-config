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
      vim.keymap.set('','<Leader>g',function () 
         print("leader g pressed!")
         require('neo-tree.command').execute({
            source = "git_status",
            position = "float"
         })
      end)
    end
}

