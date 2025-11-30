-- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local ASCII_DIR = vim.fn.stdpath("config") .. "/images/"

local function loadAscii()
	math.randomseed(os.time())
	local collected = {}
	local filenames = vim.fn.readdir(ASCII_DIR)
	if #filenames == 0 then
		return {}
	end
	for ____, filename in ipairs(filenames) do
		local fullPath = ASCII_DIR .. tostring(filename)
		if vim.fn.filereadable(fullPath) == 1 then
			collected[#collected + 1] = fullPath
		end
	end
	local random = math.random(#collected)
	local picked = collected[random]
	if not picked then
		return vim.print("failed to pick file (no file picked)")
	end
	return vim.fn.readfile(picked)
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = loadAscii()

dashboard.section.buttons.val = {
	dashboard.button("f", "📜  Find file", ":FzfLua files <CR>"),
	dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "🕙  Recently used files", ":FzfLua oldfiles <CR>"),
	dashboard.button("t", "🔎  Find text", ":FzfLua live_grep <CR>"),
	dashboard.button("c", "🔧  Configuration", ":e ~/.config/nvim/<CR>"),
	dashboard.button("q", "❌  Quit Neovim", ":qa<CR>"),
}

local function footer()
	return "Stay Curious"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
