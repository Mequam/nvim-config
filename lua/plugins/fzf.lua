local opts = function()
	local fzf = require("fzf-lua")
	local actions = fzf.actions
	local lazy_actions = {
		["alt-i"] = { actions.toggle_ignore },
		["alt-h"] = { actions.toggle_hidden },
	}
	return {
		"default-title",
		winopts = { preview = { layout = "flex", flip_columns = 600 } },
		keymap = { fzf = { ["alt-s"] = "select-all+accept", ["alt-q"] = "select+accept" } },
		files = { cwd_prompt = false, actions = lazy_actions },
		grep = { actions = lazy_actions },
	}
end

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "FzfLua" },
	config = true,
	opts = opts,
	keys = {
		{ "<leader>b", "<cmd>FzfLua buffers<CR>", desc = "Fzf buffers" },
		{ "<leader>p", "<cmd>FzfLua registers<CR>", desc = "Fzf registers" },
		{ "gs", "<cmd>FzfLua git_status<CR>", desc = "Fzf git_status" },
		{ "gb", "<cmd>FzfLua git_bcommits<CR>", desc = "Fzf git_bcommits" },
		{ "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Fzf live_grep" },
		{ "<leader>o", "<cmd>FzfLua oldfiles<CR>", desc = "Fzf oldfiles" },
		{ "<C-p>", "<cmd>FzfLua colorschemes<CR>", desc = "Fzf colorschemes" },
	},
}
