local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- simple function that searches through the contents of a 
-- given file
-- takes directory and search as options
local search_contents = function(opts)
  opts = opts or {}

  if opts["directory"] ~= nil then
     opts.directory = "."
  end

   local ret_val = {}
   local handle = io.popen("find " .. opts.directory  .. " -not -path '*.git/*' 2>/dev/null")

   local line = handle:read("*l")
   while line do
      table.insert(ret_val,line)
      line = handle:read("*l")
   end
   
   return ret_val
end

-- picker function that runs a telescope picker to
-- search through a given directory for a given search string
-- takes directory and search as options
local telescope_content_picker = function(opts)
  opts = opts or {}

  if opts["directory"] ~= nil then
     opts.directory = "."
  end

  pickers.new(opts, {
      attach_mappings = function(prompt_bufnr, map)
         actions.select_default:replace(function()
           actions.close(prompt_bufnr)
           local selection = action_state.get_selected_entry()
           vim.api.nvim_put({"[".. opts.link_name .."](".. selection.value .. ")"}, "", false, true)
         end)
         return true
    end,

    prompt_title = "matches",
    finder = finders.new_table {
      results = search_contents(opts),
      entry_maker = function(entry)
         return {
                  value = entry,
                  display = entry,
                  ordinal = entry,
                  path = entry,
                  lnum = 0
               }
      end
    },
    previewer = conf.grep_previewer(opts),
    sorter = conf.generic_sorter(opts)
  }):find()
end

function pick_on_input()
   local link_name = vim.fn.input("link display text: ")
   telescope_content_picker(require('telescope.themes').get_dropdown({link_name=link_name,directory="."}))
end

-- return module
local M = {}
   M.telescope_content_picker = telescope_content_picker
   M.search_contents = search_contents
   M.link_markdown = pick_on_input

return M
