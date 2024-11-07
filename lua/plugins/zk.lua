return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
    -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
     -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
     picker = "fzf",
     lsp = {
       -- `config` is passed to `vim.lsp.start_client(config)`
--       config = {
--         cmd = { "zk", "lsp" },
--         name = "zk",
--         -- on_attach = ...
--         -- etc, see `:h vim.lsp.start_client()`
--       },
       -- automatically attach buffers in a zk notebook that match the given filetypes
       auto_attach = {
         enabled = false,
         filetypes = { "markdown" },
       },
     },
    })

      zk = require('zk')
      --
      function new_note(directory)
         local name = vim.fn.input("note name: ")
         local cw = vim.fn.getcwd()
         vim.api.nvim_set_current_dir(directory)
         zk.new({title=name})
         vim.api.nvim_set_current_dir(cw)
      end
      
      vim.keymap.set('n','<leader>n',function ()
         new_note("~/Documents/notes/primary_zk/")
      end) --make a new note

      vim.keymap.set('n','<leader>j',function ()
         new_note("~/Documents/posts/")
      end) --make a new note

      vim.keymap.set('n','<leader><C-J>',function ()
         local cw = vim.fn.getcwd()
         
         vim.api.nvim_set_current_dir("~/Documents/posts/")
         require("zk.commands").get("ZkNotes")()
         vim.api.nvim_set_current_dir(cw)
      end) --make a new note

      vim.keymap.set('n','<C-N>',function () --find note
         local cw = vim.fn.getcwd()
         
         vim.api.nvim_set_current_dir("~/Documents/notes/primary_zk/")
         require("zk.commands").get("ZkNotes")()
         vim.api.nvim_set_current_dir(cw)
      end
      )

   vim.api.nvim_create_autocmd("FileType", {
     pattern = "markdown",
     callback = function(args)
         vim.keymap.set('n','gf','gf',{buffer = args.buf})
     end
   })
  end
}

--return {
--  "epwalsh/obsidian.nvim",
--  version = "*",  -- recommended, use latest release instead of latest commit
--  lazy = true,
--  ft = "markdown",
--  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
--  -- event = {
--  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
--  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
--  --   "BufReadPre path/to/my-vault/**.md",
--  --   "BufNewFile path/to/my-vault/**.md",
--  -- },
--  dependencies = {
--    -- Required.
--    "nvim-lua/plenary.nvim",
--
--    -- see below for full list of optional dependencies 👇
--  },
--  opts = {
--    workspaces = {
--      {
--        name = "personal",
--        path = "~/Documents/vaults/personal",
--      },
--      {
--        name = "work",
--        path = "~/Documents/vaults/work",
--      },
--    },
--
--    -- see below for full list of options 👇
--  },config = function()
--      obsidian = require('obsidian')
--
--      
--      function new_note()
--         local name = vim.fn.input("note name: ")
--         n = obsidian.Note.new({
--            id = name
--         })
--         path = "./"..name .. ".md"
--         n:save({path=path})
--         vim.cmd.edit(path)
--      end
--
--      vim.keymap.set('n','<C-N>',new_note)
--  end
--}
