return {
	"snacks.nvim",
	opts = {
		input = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		picker = { enabled = true },
		dashboard = { example = "advanced" },
	},
	keys = {
		{
			"<leader>gf",
			function(opts)
				Snacks.lazygit.log_file(opts)
			end,
			desc = "Git Logs file",
		},
	},
}
