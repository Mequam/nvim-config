--print("hello from the lsp config")
--local port = '6005'
--local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
--local pipe = '/tmp/godot.pipe' -- I use /tmp/godot.pipe
--
--vim.lsp.start({
--  name = 'Godot',
--  cmd = cmd,
--  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
--  on_attach = function(client, bufnr)
--    vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
--  end
--})

-- Set default root markers for all clients
--


-- global configurations
local lsppath = vim.api.nvim_list_runtime_paths()[1]
                .. "/lua/lsp"

vim.lsp.config('*', {
  root_markers = { '.git' },
})


function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

--load lsp configurations
function initilize()
   for _,v in pairs(scandir(lsppath)) do
      local fname = string.gsub(v,".lua","") --no extensions
      local language_server_config = require("lsp." .. fname)
      vim.lsp.config(fname,language_server_config)
      vim.lsp.enable(fname)
   end
end

initilize()

vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })

-- calls the omni complete function
function callOmniFunc()
   --local omnifunc = vim.bo.omnifunc
   if omnifunc == '' then
     return
   end

   ---- Step 1: ask omnifunc where completion starts
   --local start = vim.fn.call(omnifunc, { 1, '' })

   ---- Get current line
   --local line = vim.api.nvim_get_current_line()
   --local base = line:sub(start + 1)

   ---- Step 2: get completion items
   --local items = vim.fn.call(omnifunc, { 0, base })

   ---- Trigger completion menu
   --vim.fn.complete(start + 1, items)
end

function openCompletion(keys)
   if  vim.v.char == '.' then
      --print(vim.inspect(keys))
      --print(vim.fn.pumvisible())
      --callOmniFunc()
   end
end

--vim.api.nvim_create_autocmd("InsertCharPre",{
--   callback=openCompletion
--})

vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { desc = "LSP: Trigger Autocompletion" })

--vim.keymap.set("i", "<C-space>", callOmniFunc, { desc = "LSP: Trigger Autocompletion" })
--autocmd InsertCharPre * call OpenCompletion()


--local triggers = {'.'}
--vim.api.nvim_create_autocmd('InsertCharPre', {
--    callback = function()
--      local x = 0
--      local y = 1/x
--      if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
--        return
--      end
--      local char = vim.v.char
--      if vim.list_contains(triggers, char) then
--        local key = vim.keycode('<C-x><C-o>')
--        vim.api.nvim_feedkeys(key, 'm', false)
--      end
--    end
--})

--call the omni func from lua
local function call_omnifunc(findstart, base)
  local of = vim.bo.omnifunc
  if of == "" then
    return nil
  end

  -- Lua omnifunc (LSP, etc.)
  if of:match("^v:lua%.") then
    local fn = vim.fn[of:gsub("^v:lua%.", "")]
    return fn(findstart, base)
  end

  -- Vimscript omnifunc
  return vim.fn.call(of, { findstart, base })
end

vim.api.nvim_create_autocmd("InsertCharPre", {
  callback = function()
    if vim.v.char ~= "." then
      return
    end

    vim.schedule(function()
      if vim.fn.pumvisible() == 1 then return end

      local of = vim.lsp.omnifunc

      local col = vim.fn.col(".") - 1
      local line = vim.fn.getline(".")
      local base = line:sub(col + 1)

      local start = of(1,"")
      local items = of(0,base)

      vim.fn.complete(start + 1, items)
    end)
  end,
})
