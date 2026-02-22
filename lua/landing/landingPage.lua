-- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local ASCII_DIR = vim.fn.stdpath("config") .. "/images/"

--randomly selects an ascii file to display,
--returns the path to the selected file
local function selectAsciiFileName()
	math.randomseed(os.time())
	local collected = {}
	local filenames = vim.fn.readdir(ASCII_DIR)
	if #filenames == 0 then
		return {}
	end

	return filenames[math.random(#filenames)]
end

local sayingMap = {
   blue="Stay Curious",
   black="Stay Ambitious",
   red="Stay Passionate",
   green="Stay Strong",
   white="Stay Humble"
}

local function loadAsciiAndFooter()
	local fileName = selectAsciiFileName()
	if not fileName then
		return vim.print("failed to pick file (no file picked)")
	end

   --parse out the saying from file.name
   local dotIndex = string.find(fileName,".txt")
   local fileNameStart = string.sub(fileName,0,dotIndex-1)
   local saying = sayingMap[fileNameStart]
   if saying == nil then
      saying = "Keep Debuging"
   end

	return {
	         header=vim.fn.readfile(ASCII_DIR .. fileName),
	         footer=saying
	      }
end

local footerWithSaying = loadAsciiAndFooter()

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = footerWithSaying.header

dashboard.section.buttons.val = {
	dashboard.button("f", "📜  Find file", ":FzfLua files <CR>"),
	dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "🕙  Recently used files", ":FzfLua oldfiles <CR>"),
	dashboard.button("t", "🔎  Find text", ":FzfLua live_grep <CR>"),
	dashboard.button("c", "🔧  Configuration", ":e ~/.config/nvim/<CR>"),
	dashboard.button("q", "❌  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = footerWithSaying.footer

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
