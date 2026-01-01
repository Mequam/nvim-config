--function yank_register()
--   vim.
local function yank_buffer()
	local prev = vim.fn.getreg('"') --get the defualt register
	vim.api.nvim_feedkeys('"' .. vim.fn.nr2char(vim.fn.getchar()) .. "y", "m", true)
	vim.fn.setreg('"', prev) --make sure we do not change default register
end
vim.keymap.set("n", "<Leader>y", yank_buffer)

--highlight yanked commands
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})

local function link_markdown()
	local fzf = require("fzf-lua")

	local result = fzf.files({})

	-- TODO: update to get to feature parity (if this is a highly used feature)

	vim.print(vim.inspect(result))
end

--markdown linking
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		vim.keymap.set("n", "<leader>l", link_markdown, { buffer = args.buf })
		vim.keymap.set("n", "<C-L>", link_markdown, { buffer = args.buf })
	end,
})
