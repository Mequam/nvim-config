function summon_inkscape()

   local handle = io.popen("inkscape ~/Documents/overlay.svg 2> /dev/null > /dev/null")
   --handle = io.popen("~/.config/nvim/lua/custom/inkscape_summoner/track_inkscape.sh")
   while handle:read("*l") do sleep(1) end

   fname = vim.fn.input("output file name: ")

   rel_path = "./assets/"..fname..".svg"

   io.popen("cp ~/Documents/overlay.svg  ~/Documents/notes/primary_zk/assets/" .. fname .. ".svg")
   
   vim.api.nvim_put({"![".. fname .."](".. rel_path .. ")"}, "", false, true)
end

vim.keymap.set("n",'<leader>i',summon_inkscape)

local M = {}

M.summon_inkscape = summon_inkscape
return M
