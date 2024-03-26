if true then return {} end

return {
"brenton-leighton/multiple-cursors.nvim",
version = "*",
opts = {
  enable_split_paste = true,
  custom_key_maps = {
    -- j and k: use gj/gk when count is 0
    {{"n", "x"}, {"j", "<Down>"}, function(_, count)
      if count == 0 then
        vim.cmd("normal! gj")
      else
        vim.cmd("normal! " .. count .. "j")
      end
    end},
    {{"n", "x"}, {"k", "<Up>"}, function(_, count)
      if count == 0 then
        vim.cmd("normal! gk")
      else
        vim.cmd("normal! " .. count .. "k")
      end
    end},
  },
  pre_hook = function()
    vim.opt.cursorline = false
    vim.cmd("NoMatchParen")
  end,
  post_hook = function()
    vim.opt.cursorline = true
    vim.cmd("DoMatchParen")
  end,
},
keys = {
  {"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i"}},
  {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>"},
  {"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i"}},
  {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>"},
  {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}},
}
}

