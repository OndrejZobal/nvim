return {
	"tpope/vim-fugitive",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<Leader>g", group = "Git" },
			{ "<Leader>gc", ":Git commit<CR>", desc = "Git commit" },
			{ "<Leader>gG", ":GBrowse<CR>", desc = "Open in browser (GitHub, GitLab, etc.)" },
			{ "<Leader>gd", ":Gdiffsplit<CR>", desc = "Git diff" },
			{ "<Leader>gg", ":tab Git<CR>", desc = "Git status" },
			{ "<Leader>gi", ":Git init<CR>", desc = "Initialize repository" },
		})
	end,
}
