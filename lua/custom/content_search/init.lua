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
   local handle = io.popen("grep -Rn --exclude-dir=.?* --exclude=.?* " .. opts.directory .. " -e '" .. opts.search .. "' 2>/dev/null")

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
    prompt_title = "matches",
    finder = finders.new_table {
      results = search_contents(opts),
      entry_maker = function(entry)
         local second_chunk = string.sub(entry,string.find(entry,':',0)+1,string.len(entry))
         local function get_first_chunk(value)
            return string.sub(value,0,string.find(value,':',0)-1)
         end

         local display = string.sub(entry,string.find(entry,"[^/]+%..+"))
         return {
                  value = entry,
                  display = display,
                  ordinal = entry,
                  path = get_first_chunk(entry),
                  lnum = tonumber(get_first_chunk(second_chunk))
               }
      end
    },
    previewer = conf.grep_previewer(opts),
    sorter = conf.generic_sorter(opts)
  }):find()
end

function pick_on_input()
   local to_search = vim.fn.input("Search String: ")
   telescope_content_picker({search=to_search,directory="."})
end

-- return module
local M = {}
   M.telescope_content_picker = telescope_content_picker
   M.search_contents = search_contents
   M.pick_on_input = pick_on_input

return M
